class PagesController < ApplicationController
  def home
  	
  	if user_signed_in?
			if current_user.user_type == "researcher"
				@games_created = Game.where(user_id: current_user.id)
			end
		end

  end
end
