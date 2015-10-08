class Player < ActiveRecord::Base
	validates_presence_of :user_id, :game_id, :member_no

	belongs_to :user
	belongs_to :game
	has_many :team_memberships, dependent: :destroy
	has_many :teams, through: :team_memberships
	has_many :team_strategies, dependent: :destroy
	has_many :project_goals, dependent: :destroy
	has_many :player_monthly_reports
end
