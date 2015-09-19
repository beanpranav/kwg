class PagesController < ApplicationController
  def home
  	
  	if user_signed_in?
			if current_user.user_type == "researcher"
				@games_created = Game.where(user_id: current_user.id)
				@games_completed = @games_created.select { |x| x["game_status"] > x["game_length"] }
				@games_in_progress = @games_created.select { |x| x["game_status"] <= x["game_length"] }
			end
		end

  end
end
