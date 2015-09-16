class ProjectGoal < ActiveRecord::Base
	validates_presence_of :player_id, :project_id, :goal_statement

	belongs_to :project
	belongs_to :player
end
