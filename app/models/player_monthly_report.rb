class PlayerMonthlyReport < ActiveRecord::Base
	validates_presence_of :player_id

	belongs_to :player
	has_many :work_schedules
end
