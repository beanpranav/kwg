class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  include PlayersHelper

  def index
    @players = Player.all
  end

  def show
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

    @player_projects = []
    @player_project_profit = 0
    @work_on_options = []
    @using_skill_options = [["Product Dev",1],["Marketing",2],["Support",3]]

    @player.teams.each do |team|
      team.projects.each do |project|
        @player_project_profit += project.profit_total[-1][2] if @player.game.game_status > 1
        @player_projects << project
        @work_on_options << [project.project_name,project.project_monthly_reports.sort_by(&:created_at).last.id] if @player.game.game_status > 0
      end
      # add research with each player options
      # team.players.each do |player|
      #   @using_skill_options << ["Research with #{player.user.first_name}","#{player.id}"]
      # end
    end
    @work_on_options = [['PROJECT ------',@work_on_options],['NOTHING ------',[["do nothing",-1]]]]

    # if research interdependence then
    # @using_skill_options = @using_skill_options.uniq{|x| x[1]}
    # else only research
    @using_skill_options << ["R&D on Product",5]
    @using_skill_options << ["R&D on Marketing",6]
    @using_skill_options << ["R&D on Support",7]

    # compiling all skill options
    @using_skill_options = [['DO ------',@using_skill_options],['IMPROVE ------',[["Product Dev skills",11], ["Marketing skills",12], ["Support skills",13], ["Research skills",14]]],['NOTHING ------',[["do nothing",-1]]]]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:user_id, :game_id, :salary_total, :skill_level, :skill_total_points, :member_no)
    end
end
