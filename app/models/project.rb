class Project < ActiveRecord::Base
	validates_presence_of :team_id, :game_id

	belongs_to :game
	belongs_to :team
	has_many :project_goals, dependent: :destroy
	has_many :players, through: :project_goals
	has_many :project_monthly_reports
end
