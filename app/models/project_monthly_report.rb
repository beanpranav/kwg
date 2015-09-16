class ProjectMonthlyReport < ActiveRecord::Base
	validates_presence_of :project_id

	belongs_to :project
	has_many :work_schedules
end
