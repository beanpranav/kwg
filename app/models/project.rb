class Project < ActiveRecord::Base
	validates_presence_of :team_id, :game_id, :project_name

	belongs_to :game
	belongs_to :team
	
	has_many :project_monthly_reports, dependent: :destroy
end
