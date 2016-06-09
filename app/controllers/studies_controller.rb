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
    @games_created = @study.games
    @games_completed = @games_created.select { |x| x['game_status'] > x['game_length'] }
    @games_in_progress = @games_created.select { |x| x['game_status'] <= x['game_length'] }
    @active_users = User.where(user_status: 'active')
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
