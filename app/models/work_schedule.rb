class WorkSchedule < ActiveRecord::Base
	validates_presence_of :player_monthly_report_id, :rank
	
	belongs_to :project_monthly_report
	belongs_to :player_monthly_report
end
