class MeasureLewi < ActiveRecord::Base
	validates_presence_of :player_id, :team_id

	belongs_to :player
	belongs_to :team
end