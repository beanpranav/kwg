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
      p = Player.new(user_id: user.id, game_id: params[:game_id], member_no: index, salary_total: 0, skill_level: [0,0,0,0], skill_total_points: [0,0,0,0])
      p.save
    end
    
    # change game status
    @game = Game.find_by(id: params[:game_id])
    @game.game_status = 0
    @game.save

    # create teams
    teams = generate_team_names($GAME_TYPES_LOOKUP[@game.game_type][:teams])
    @players = Player.where(game_id: @game.id).pluck(:id, :member_no)

    teams.each.with_index do |team, i|
      @t = Team.new(game_id: @game.id, team_name: team)
      @t.save

      # create projects
      $GAME_TYPES_LOOKUP[@game.game_type][:project_split][i].times do
        pj = Project.new(team_id: @t.id, game_id: @game.id, project_name: generate_project_name, stats_total: [0,0,0], rnd_stage: [0,0,0], rnd_total_points: [0,0,0], profit_total: [0], users_total: 0)
        pj.save
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
    # Do caluclations for current month and update all reports
    
    # NEXT MONTH ACTIONS
    if @game.game_status < @game.game_length
      # create each player's monthly reports
      @game.players.pluck(:id).each do |player_id|
        @pr = PlayerMonthlyReport.new(player_id: player_id, month_no: @game.game_status+1, salary_generated: 0, skill_points_generated: [0,0,0,0])
        @pr.save
        
        # create 8 work schedules for each report
        8.times do |i|
          ws = WorkSchedule.new(player_monthly_report_id: @pr.id, rank: i+1)
          ws.save
        end
      end

      # create each project's monthly report
       @game.projects.pluck(:id).each do |project_id|
        pjr = ProjectMonthlyReport.new(project_id: project_id, profit_generated: [0,0,0], stats_generated: [0,0,0], rd_generated: [0,0,0], users_generated: 0,)
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
      flash[:notice] = "Calculations updated. Game is completed."
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
