class TeamStrategy < ActiveRecord::Base
	validates_presence_of :team_id, :player_id, :strategy_statement

	belongs_to :player
	belongs_to :team
end
