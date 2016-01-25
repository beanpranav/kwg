class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :continue_game]
  include GamesHelper

  def index
    @games = Game.all
  end

  def show
    if @game.game_status == -1
      @active_users = User.where(user_status: "active")
    else
      @player_project_totals = [0,0,0,0,0,0,0,0]
    end

    @players = @game.players.sort_by(&:id)

    if @game.game_status > 1
      @player_project_profit = [0,0,0,0,0,0,0,0]

      @players.each_with_index do |p,i|
        p.teams.each do |t|
          t.projects.each do |prj|
            prj.profit_total.each do |q|
              @player_project_profit[i] += q[2]
            end
          end
        end
      end

      @project_profits = 0
      # p
      # @game.teams.sort_by(&:id).each do |team|
      #   team.projects.each do |project|
          
      #     project.profit_total.each do |q|
      #       @project_profits << q[2]
      #     end
      #   end
      # end
    end

  end

  def new
    @game = Game.new(user_id: params[:user_id], access_treatement: false, game_status: -1)
  end

  def edit
  end

  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign_players
    # create players
    active_users = User.where(user_status: "active").order("RANDOM()").limit(params[:n])
    active_users.each.with_index(1) do |user, index|
      user.user_status = "playing"
      user.save
      p = Player.new(user_id: user.id, game_id: params[:game_id], member_no: index, salary_total: 0, skill_level: [1,1,1,1], skill_total_points: [1,1,1,1])
      p.save
    end
    
    # change game status
    @game = Game.find_by(id: params[:game_id])
    @game.game_status = 0
    @game.save

    # create teams
    project_counter = 0
    teams = generate_team_names($GAME_TYPES_LOOKUP[@game.game_type][:teams])
    @players = Player.where(game_id: @game.id).pluck(:id, :member_no)

    teams.each.with_index do |team, i|
      @t = Team.new(game_id: @game.id, team_name: team)
      @t.save

      # create projects
      $GAME_TYPES_LOOKUP[@game.game_type][:project_split][i].times do
        pj = Project.new(team_id: @t.id, game_id: @game.id, project_name: generate_project_name(project_counter), stats_total: [0,0,0], rnd_stage: [1,1,1], rnd_total_points: [1,1,1], profit_total: [])
        pj.save
        project_counter += 1
      end

      # assign membership
      $GAME_TYPES_LOOKUP[@game.game_type][:membership_split][i].each do |member_no|
        tm = TeamMembership.new(team_id: @t.id, player_id: @players.select{|p| p[1] == member_no}[0][0])
        tm.save
      end
    end
    
    # return
    flash[:notice] = "#{params[:n]} Players are successfully assigned to this game."
    redirect_to request.referrer
  end

  def continue_game
    # THIS MONTH ACTIONS
    players = @game.players.sort_by(&:id)
    projects = @game.projects.sort_by(&:id)

    # Do caluclations for current month and update all reports
    unless @game.game_status == 0
      
      # convert work schedule to player: salary, skills and project: expense, productivity
      players.each do |player|

        player_report = PlayerMonthlyReport.find_by(player_id: player.id, month_no: @game.game_status)

        player_report.work_schedules.each do |ws|
          unless ws.skill_use.to_i <= 0 or ws.project_monthly_report_id <= 0
            # set skill no used
            if ws.skill_use.to_i > 4 and ws.skill_use.to_i < 8 
              skill_no = 4 
            else 
              skill_no = ws.skill_use.to_i 
            end
            
            # player salary and project expense
            project_report = ws.project_monthly_report
            if skill_no < 5
              player_report.salary_generated += $SKILL_SALARY[skill_no][player.skill_level[skill_no-1].to_i]
              project_report.expense_generated += $SKILL_SALARY[skill_no][player.skill_level[skill_no-1].to_i]
            else
              player_report.salary_generated += $SKILL_SALARY[skill_no-10][player.skill_level[skill_no-11].to_i]
              project_report.expense_generated += $SKILL_SALARY[skill_no-10][player.skill_level[skill_no-11].to_i]
            end

            # player skill points
            case skill_no
            when 1,11
              player_report.skill_points_generated_1 += $SKILL_POINTS[skill_no][player.skill_level[0].to_i]
            when 2,12
              player_report.skill_points_generated_2 += $SKILL_POINTS[skill_no][player.skill_level[1].to_i]
            when 3,13
              player_report.skill_points_generated_3 += $SKILL_POINTS[skill_no][player.skill_level[2].to_i]
            when 4,14
              player_report.skill_points_generated_4 += $SKILL_POINTS[skill_no][player.skill_level[3].to_i]
            end

            # project productivity
            case ws.skill_use.to_i
            when 1
              project_report.skill_1_stats_generated += $SKILL_PRODUCTIVITY[1][player.skill_level[0].to_i]
            when 2
              project_report.skill_2_stats_generated += $SKILL_PRODUCTIVITY[2][player.skill_level[1].to_i]
            when 3
              project_report.skill_3_stats_generated += $SKILL_PRODUCTIVITY[3][player.skill_level[2].to_i]
            when 5,6,7
              project_report.skill_4_stats_1_generated += $SKILL_PRODUCTIVITY[ws.skill_use.to_i][player.skill_level[3].to_i]
            end

            project_report.save

          end
        end
        player_report.save
        
        # update Player salary, skill points and levels
        player.salary_total += player_report.salary_generated
        player.skill_total_points = [
          player.skill_total_points[0]+player_report.skill_points_generated_1,
          player.skill_total_points[1]+player_report.skill_points_generated_2,
          player.skill_total_points[2]+player_report.skill_points_generated_3,
          player.skill_total_points[3]+player_report.skill_points_generated_4
        ]
        player.skill_total_points_will_change!
        player.skill_level = [
          $SKILL_LEVELS.detect { |points,level| points === player.skill_total_points[0] }.last,
          $SKILL_LEVELS.detect { |points,level| points === player.skill_total_points[1] }.last,
          $SKILL_LEVELS.detect { |points,level| points === player.skill_total_points[2] }.last,
          $SKILL_LEVELS.detect { |points,level| points === player.skill_total_points[3] }.last,
        ]
        player.skill_level_will_change!
        player.save

        
      end

      # update project 
      projects.each do |project|

        # update expense, stats, rnd points and stages
        project_report = ProjectMonthlyReport.find_by(project_id: project.id, month_no: @game.game_status)

        if @game.game_status % 3 == 1
          project.profit_total << [0,project_report.expense_generated,0]
        else
          project.profit_total[-1] = [0,project.profit_total[-1][1]+project_report.expense_generated,0]
        end
        project.profit_total_will_change!
        project.rnd_total_points = [
          project.rnd_total_points[0]+project_report.skill_4_stats_1_generated,
          project.rnd_total_points[1]+project_report.skill_4_stats_2_generated,
          project.rnd_total_points[2]+project_report.skill_4_stats_3_generated
        ]
        project.rnd_total_points_will_change!
        project.rnd_stage = [
          $RND_STAGES.detect { |points,stage| points === project.rnd_total_points[0] }.last[:stage_no],
          $RND_STAGES.detect { |points,stage| points === project.rnd_total_points[1] }.last[:stage_no],
          $RND_STAGES.detect { |points,stage| points === project.rnd_total_points[2] }.last[:stage_no]
        ]
        project.rnd_stage_will_change!
        project.stats_total = [
          (project.stats_total[0]+project_report.skill_1_stats_generated*$RND_STAGES.detect { |points,stage| points === project.rnd_total_points[0] }.last[:multiplier_1]).to_i,
          (project.stats_total[1]+project_report.skill_2_stats_generated*$RND_STAGES.detect { |points,stage| points === project.rnd_total_points[1] }.last[:multiplier_2]).to_i,
          (project.stats_total[2]+project_report.skill_3_stats_generated*$RND_STAGES.detect { |points,stage| points === project.rnd_total_points[2] }.last[:multiplier_3]).to_i
        ]
        project.stats_total_will_change!
  
        project.save
  
        # Quaterly actions
        if @game.game_status % 3 == 0
          # Calculate users, revenue and profits
          old_users = project.stats_total[2]*$SUPPORTED_CONVERSION + (project.users_total[-1][2]-project.stats_total[2])*$UNSUPPORTED_CONVERSION
          new_users = project.stats_total[1]*$MARKET_CONVERSION
          active_users = if project.stats_total[0] < old_users+new_users then project.stats_total[0] else old_users+new_users end
          
          project.users_total << [old_users, new_users, active_users]
          project.users_total_will_change!

          q_revenue = active_users*$PRODUCT_UNIT_COST
      
          project.profit_total[-1] = [q_revenue, project.profit_total[-1][1], q_revenue-project.profit_total[-1][1]]
          project.profit_total_will_change!

          # reset quaterly project stats
          project.stats_total = [project.stats_total[0],0,0]
          project.stats_total_will_change! 
        
          project.save  
        end
      end

    end
    
    # NEXT MONTH ACTIONS
    if @game.game_status < @game.game_length
      # create each player's monthly reports
      players.each do |player|
        @pr = PlayerMonthlyReport.new(player_id: player.id, month_no: @game.game_status+1, salary_generated: 0)
        @pr.save
        
        # create 8 work schedules for each report
        8.times do |i|
          ws = WorkSchedule.new(player_monthly_report_id: @pr.id, rank: i+1)
          ws.save
        end
      end

      # create each project's monthly report
      projects.each do |project|
        pjr = ProjectMonthlyReport.new(project_id: project.id, month_no: @game.game_status+1)
        pjr.save
      end
    end

    # set game status to next month
    @game.game_status += 1
    @game.save

    # return
    if @game.game_status == 0
      flash[:notice] = "Game is intiated. Starting with Month #{@game.game_status}."
    elsif @game.game_status < @game.game_length
      flash[:notice] = "Calculations updated. Game progresses to Month #{@game.game_status}."
    else
      flash[:notice] = "Calculations updated. Game completed."
    end
    redirect_to request.referrer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:user_id, :game_type, :game_length, :game_status, :access_treatement, :session_name, :game_codename)
    end
end
