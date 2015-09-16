class WorkSchedule < ActiveRecord::Base
	validates_presence_of :player_monthly_report_id, :rank
	
	has_many :project_monthly_reports
	has_many :player_monthly_reports
end
