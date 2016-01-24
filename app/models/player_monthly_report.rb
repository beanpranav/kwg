class PlayerMonthlyReport < ActiveRecord::Base
	validates_presence_of :player_id, :month_no

	belongs_to :player
	has_many :work_schedules, dependent: :destroy
end
