class TeamMembership < ActiveRecord::Base
	validates_presence_of :player_id, :team_id, :player_no

	belongs_to :player
	belongs_to :team
end
