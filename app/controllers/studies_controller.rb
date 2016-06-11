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

    @games_control = @games_completed.select { |x| !x.access_treatement }
    @projects_control = 0
    @pc_lmtm = 0
    @pc_lmtm_profits = 0
    @pc_hmtm = 0
    @pc_hmtm_profits = 0
    @games_control.each do |game|
      @projects_control += game.projects.count
      project_list = game.projects.sort_by(&:id)
      l_set = 0
      $GAME_TYPES_LOOKUP[game.game_type][:project_split].each_with_index do |p, i|
        if p > 1
          # low MTM project
          @pc_lmtm += p
          p.times do |k|
            @pc_lmtm_profits += project_list[i + l_set * (p - 1) + k].profit_total.map { |_r, _e, profit| profit }.sum
          end
          l_set += 1
        else
          #  High MTM project
          @pc_hmtm += p
          @pc_hmtm_profits += project_list[i].profit_total.map { |_r, _e, profit| profit }.sum
        end
      end
    end

    @games_treatment = @games_completed.select(&:access_treatement)
    @projects_treatment = 0
    @pt_lmtm = 0
    @pt_lmtm_profits = 0
    @pt_hmtm = 0
    @pt_hmtm_profits = 0
    @games_treatment.each do |game|
      @projects_treatment += game.projects.count
      project_list = game.projects.sort_by(&:id)
      l_set = 0
      $GAME_TYPES_LOOKUP[game.game_type][:project_split].each_with_index do |p, i|
        if p > 1
          # low MTM project
          @pt_lmtm += p
          p.times do |k|
            @pt_lmtm_profits += project_list[i + l_set * (p - 1) + k].profit_total.map { |_r, _e, profit| profit }.sum
          end
          l_set += 1
        else
          #  High MTM project
          @pt_hmtm += p
          @pt_hmtm_profits += project_list[i].profit_total.map { |_r, _e, profit| profit }.sum
        end
      end
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
    params.require(:study).permit(:title, :completed, :slug, :user_id)
  end
end
