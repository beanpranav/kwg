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
		end
  end

 	def demo_screenshots
 	end

  def activate_user
  	user = User.find(params[:user_id])
  	user.user_status = "active"
  	user.save
  	redirect_to request.referrer
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
 	
end
