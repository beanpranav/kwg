class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy, :update_measure_austin, :update_measure_lewis, :update_measure_workload, :go_offline]
  before_action :authenticate_user!
  before_action :authenticate_admin, only: [:index]
  before_action :correct_user, only: [:show, :edit, :update]
  include PlayersHelper

  def index
    @players = Player.all
  end

  def show
    # Game Completed
      if @player.game.game_status == 100        
        # Survery Count = austin + workload + lewis
          @total_surveys = 2+@player.teams.count

        # Austin
          if @player.measure_austin.is_complete == false
            # list all team-members
            @co_players = []
            @player.game.players.each do |p|
              @co_players << [p.id, p.player_screenname]
            end
            @measure_austin_options = [["Novice",1],["Advanced",2],["Expert",4]]

        # Lewis
          elsif @player.measure_lewis.sort_by(&:id)[0].is_complete == false
        
        # Conditional Lewis 
          elsif @player.teams.count > 1 and @player.measure_lewis.sort_by(&:id)[1].is_complete == false
          
        # Workload
          elsif @player.measure_workload.is_complete == false
          
        # Results
          else

            @players = @player.game.players.sort_by(&:id)
            @player_project_profit = [0,0,0,0,0,0,0,0,0,0,0,0]

            @players.each_with_index do |p,i|
              p.teams.each do |t|
                t.projects.each do |prj|
                  prj.profit_total.each do |q|
                    @player_project_profit[i] += q[2]
                  end
                end
              end
            end

            @project_profits = []
            @projects = @player.game.projects.sort_by(&:id)
            @projects.each do |p|
              @project_profits << p.profit_total.map {|r,e,p| p}.sum
            end
          end

    # Game in progress
      else

        # Organize quaterly reports
          @current_month = @player.game.game_status
          @current_quarter = ((@current_month-1)/3)+1

          quarters_count = @player.game.game_length/3
          @quarter_reports = Array.new(quarters_count){Array.new(3,0)}
          reports = @player.player_monthly_reports.sort_by(&:month_no) 
          
          quarters_count.times do |q|
            3.times do |m|
              if reports.detect {|r| r.month_no == q*3+m+1}
                @quarter_reports[q][m] = reports.select {|r| r.month_no == q*3+m+1}
              end
            end
          end
        
        # Calculate and organize project-wise profits
          @player_projects = []
          @player_project_profit = 0
          @work_on_options = []

          @player.teams.each do |team|
            team.projects.sort_by(&:id).each do |project|
              if @player.game.game_status > 1
                project.profit_total.each do |q_stats|
                  @player_project_profit += q_stats[2]
                end 
              end  
              @player_project_profit += $STARTING_INVESTMENT    
              @player_projects << project
              @work_on_options << [project.project_name,project.project_monthly_reports.sort_by(&:created_at).last.id] if @player.game.game_status > 0
            end
          end

        # Constants for display
          @gs_adjustment_factor = $GAME_TYPES_LOOKUP[@player.game.game_type][:group_size]
          @work_on_options = [['APP ------',@work_on_options],['NOTHING ------',[["do nothing",-1]]]]
          @using_skill_options = [
                                  ['DO ------',[["App Dev",1],["Marketing",2],["Support",3]]],
                                  ['DO R&D ------',[["R&D on App Dev",5],["R&D on Marketing",6],["R&D on Support",7]]],
                                  ['IMPROVE MY SKILL ---',[["Study App Dev",11], ["Study Marketing",12], ["Study Support",13], ["Study R&D",14]]],
                                  ['NOTHING ------',[["do nothing",-1]]]
                                ]

      end
  end

  def new
    @player = Player.new
  end

  def edit
  end

  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
    end
  end

  def update_work_schedule
    player_monthly_report = PlayerMonthlyReport.find(params[:monthly_report_id])
    player_monthly_report.work_schedules.sort_by(&:rank).each.with_index do |work_item, i|
      work_item.project_monthly_report_id = params[:project_monthly_report_ids][i]
      work_item.skill_use = params[:skill_uses][i]
      work_item.save
    end 
    redirect_to request.referrer
  end

  def update_measure_austin
    m = @player.measure_austin
    players_count = params[:input_skills].count/4

    skill_1_levels = []
    skill_2_levels = []
    skill_3_levels = []
    skill_4_levels = []
    players_count.times do |i|
      skill_1_levels << [m.skill_1_player_levels[i][0],params[:input_skills][i*4]]
      skill_2_levels << [m.skill_1_player_levels[i][0],params[:input_skills][i*4+1]]
      skill_3_levels << [m.skill_1_player_levels[i][0],params[:input_skills][i*4+2]]
      skill_4_levels << [m.skill_1_player_levels[i][0],params[:input_skills][i*4+3]]
    end
    m.skill_1_player_levels = skill_1_levels
    m.skill_1_player_levels_will_change!
    m.skill_2_player_levels = skill_2_levels
    m.skill_2_player_levels_will_change!
    m.skill_3_player_levels = skill_3_levels
    m.skill_3_player_levels_will_change!
    m.skill_4_player_levels = skill_4_levels
    m.skill_4_player_levels_will_change!

    m.is_complete = true
    m.save

    flash[:notice] = "Survey 1 saved successfully."
    redirect_to request.referrer
  end

  def update_measure_lewis
    m = @player.measure_lewis.sort_by(&:id)[params[:lewis_no].to_i]
    m.responses_specialization = [params[:lewis_1],params[:lewis_2],params[:lewis_3],params[:lewis_4],params[:lewis_5]]
    m.responses_credibility = [params[:lewis_6],params[:lewis_7],params[:lewis_8],6-params[:lewis_9].to_i,6-params[:lewis_10].to_i]
    m.responses_coordination = [params[:lewis_11],params[:lewis_12],6-params[:lewis_13].to_i,params[:lewis_14],6-params[:lewis_15].to_i]

    m.is_complete = true
    m.save

    flash[:notice] = "Survey #{2+params[:lewis_no].to_i} saved successfully."
    redirect_to request.referrer
  end

  def update_measure_workload
    m = @player.measure_workload
    m.responses = [params[:workload_1],params[:workload_2],params[:workload_3].to_i,params[:workload_4],params[:workload_5].to_i]

    m.is_complete = true
    m.save

    flash[:notice] = "Last survey saved successfully."
    redirect_to request.referrer
  end

  def go_offline
    u = @player.user
    u.user_status = "offline"
    u.player_name = ""
    u.player_screenname = ""
    u.gender = ""
    u.save
    flash[:notice] = "Thank you for playing!"
    sign_out u
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    def correct_user
      if  @player.user == current_user or @player.game.user_id == current_user.id
      # current user's game
        true
      else
      # no access
        redirect_to root_path, notice: "You don't have permission to view this page.".html_safe
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:user_id, :game_id, :salary_total, :skill_level, :skill_total_points, :member_no)
    end
end
