class PagesController < ApplicationController
  
  def home
  	if user_signed_in?
			if current_user.user_type == "researcher"
				@games_created = Game.where(user_id: current_user.id)
				@games_completed = @games_created.select { |x| x["game_status"] > x["game_length"] }
				@games_in_progress = @games_created.select { |x| x["game_status"] <= x["game_length"] }
			else
				@current_game_screen = current_user.players.sort_by(&:id).last
			end

    else
      redirect_to new_user_session_path
		end
  end

 	def demo_screenshots
 	end

  def activate_tut0
    user = User.find(params[:user_id])
    user.tut0 = true
    user.save
    flash[:notice] = "Read and complete the consent form below."
    redirect_to request.referrer
  end

  def activate_tut1
    user = User.find(params[:user_id])
    if (params[:a1] == "1" and params[:a2] == "1")
      user.tut1 = true
      user.save
      flash[:notice] = "Read and complete the consent form below."
      redirect_to request.referrer
    else
      user.tut1 = false
      user.save
      flash[:notice] = "Some of your answers were incorrect. Please retry."
      redirect_to request.referrer
    end
  end

  def activate_tut2
    user = User.find(params[:user_id])
  end

  def activate_tut3
    user = User.find(params[:user_id])

    if (user.valid_age and user.valid_read and user.valid_consent)
      user.user_status = "active"
      user.save
    else
    end
  end

  def activate_user
  	user = User.find(params[:user_id])
    user.player_name = params[:full_name]
    user.player_screenname = params[:screen_name]
    user.gender = params[:gender]
    user.valid_age = params[:age]
    user.valid_read = params[:read]
    user.valid_consent = params[:consent]
    user.save
    
    if (user.valid_age and user.valid_read and user.valid_consent)
      flash[:notice] = "Let's begin the Tutorial"
  	  redirect_to request.referrer
    else
      user.player_name = ""
      user.player_screenname = ""
      user.gender = ""
      user.valid_age = false
      user.valid_read = false
      user.valid_consent = false
      user.user_status = "offline"
      user.save
      flash[:notice] = "Some fields were not filled properly - please refill the form and submit again."
      redirect_to request.referrer
    end
  end

  def tutorial_personal_dashboard
    @sample_projects = ["vChat","vTunes"]
    @sample_skill_level = [1,1,1,1]
    @sample_skill_total_points = [1,1,1,1]
    @gs_adjustment_factor = 3
  end

  def tutorial_work_calendar
    @sample_projects = ["vChat","vTunes"]
    @sample_skill_level = [1,1,1,1]
    @sample_skill_total_points = [1,1,1,1]
    @gs_adjustment_factor = 3
  end

  def tutorial_project_information
    @sample_projects = ["vChat","vTunes"]
    @sample_skill_level = [1,1,1,1]
    @sample_skill_total_points = [1,1,1,1]
    @gs_adjustment_factor = 3
    @sample_rnd_total_points = [1,1,1,1]
    @sample_players = ["You","Team Member 1","Team Member 2","..."]
  end

  def tutorial_gameplay_choices
    @sample_projects = ["vChat","vTunes"]
    @sample_skill_level = [1,1,1,1]
    @sample_skill_total_points = [1,1,1,1]
    @gs_adjustment_factor = 3
    @sample_rnd_total_points = [1,1,1,1]
    @sample_players = ["You","Team Member 1","Team Member 2","..."]
    @task_choices = ["App Dev","App Dev","Marketing","Marketing","App Dev","App Dev","5","11"]
    @app_choices = [1,1,1,1,2,2,1,1]
  end

  def tutorial_gameplay_results
    @sample_projects = ["vChat","vTunes"]
    @sample_skill_level = [1,1,1,1]
    @sample_skill_total_points = [141,21,11,1]
    @gs_adjustment_factor = 3
    @sample_rnd_total_points = [241,1,1,1]
    @sample_players = ["You","Team Member 1","Team Member 2","..."]
  end
 	
end
