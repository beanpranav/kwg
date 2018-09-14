# rubocop:disable Metrics/LineLength
class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin, only: [:index]
  before_action :correct_user, only: [:show, :edit, :update]

  def index
    @studies = Study.all
  end

  def show
    @total_games = @study.games
    @games_completed = @total_games.select { |x| x.game_status > x.game_length }
    @games_in_progress = @total_games.select { |x| x.game_status <= x.game_length }
    @active_users = User.where(user_status: 'active')
    @logged_users = User.where("user_status = 'survey' OR user_status = 'inactive'")

    # Access Condition Calculations
    @games_access = []
    @games_access[0] = @games_completed.select { |x| !x.access_treatement }
    @games_access[1] = @games_completed.select(&:access_treatement)
    
    @projects_access = [0,0]
    @pa_lmtm = [0,0]
    @pa_lmtm_profits = [0,0]
    @pa_hmtm = [0,0]
    @pa_hmtm_profits = [0,0]
    @games_access.each_with_index do |condition, condition_index|
      condition.each do |game|
        @projects_access[condition_index] += game.projects.count
        project_list = game.projects.sort_by(&:id)
        project_index = 0
        $GAME_TYPES_LOOKUP[game.game_type][:project_split].each_with_index do |p, i|
          if p > 1
            # low MTM project
            @pa_lmtm[condition_index] += p
            p.times do
              @pa_lmtm_profits[condition_index] += project_list[project_index].profit_total.map { |_r, _e, profit| profit }.sum
              project_index += 1
            end
          else
            #  High MTM project
            @pa_hmtm[condition_index] += p
            @pa_hmtm_profits[condition_index] += project_list[project_index].profit_total.map { |_r, _e, profit| profit }.sum
            project_index += 1
          end
        end
      end
    end
        
    # Team Composition Calculations
    @games_composition = []
    $TEAM_COMPOSITIONS.each_with_index do |tc,i|
      @games_composition[i] = @games_completed.select { |x| x.team_composition == tc }
    end 
    @projects_compostion = Array.new($TEAM_COMPOSITIONS.length, 0)
    @ptc_lmtm = Array.new($TEAM_COMPOSITIONS.length, 0)
    @ptc_lmtm_profits = Array.new($TEAM_COMPOSITIONS.length, 0)
    @ptc_hmtm = Array.new($TEAM_COMPOSITIONS.length, 0)
    @ptc_hmtm_profits = Array.new($TEAM_COMPOSITIONS.length, 0)
    @games_composition.each_with_index do |condition, condition_index|
      condition.each do |game|
        @projects_compostion[condition_index] += game.projects.count
        project_list = game.projects.sort_by(&:id)
        project_index = 0
        $GAME_TYPES_LOOKUP[game.game_type][:project_split].each_with_index do |p, i|
          if p > 1
            # low MTM project
            @ptc_lmtm[condition_index] += p
            p.times do
              @ptc_lmtm_profits[condition_index] += project_list[project_index].profit_total.map { |_r, _e, profit| profit }.sum
              project_index += 1
            end
          else
            #  High MTM project
            @ptc_hmtm[condition_index] += p
            @ptc_hmtm_profits[condition_index] += project_list[project_index].profit_total.map { |_r, _e, profit| profit }.sum
            project_index += 1
          end
        end
      end
    end

    respond_to do |format|
      
      format.html
      format.csv {
        if params[:content] == 'project'
          send_data @study.project_csv, filename: "KWG_#{@study.title}_projects.csv"
        else
          send_data @study.player_csv, filename: "KWG_#{@study.title}_players.csv"
        end
      }
    end
  end

  def new
    @study = Study.new(user_id: current_user.id, completed: false)
  end

  def edit
  end

  def create
    @study = Study.new(study_params)

    respond_to do |format|
      if @study.save
        format.html { redirect_to @study, notice: 'Study was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @study.update(study_params)
        format.html { redirect_to @study, notice: 'Study was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @study.destroy
    respond_to do |format|
      format.html { redirect_to studies_url, notice: 'Study was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_study
    @study = Study.find(params[:id])
  end

  def correct_user
    if @study.user_id == current_user.id
      # current user's game
      true
    else
      # no access
      redirect_to root_path, notice: "You don't have permission to view this page.".html_safe
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def study_params
    params.require(:study).permit(:title, :completed, :slug, :user_id, :chat_link, :survey_link, :consent)
  end
end
