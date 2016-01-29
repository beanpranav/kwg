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

 	
end
