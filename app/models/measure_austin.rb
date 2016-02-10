class MeasureAustin < ActiveRecord::Base
	validates_presence_of :player_id

	belongs_to :player
end
