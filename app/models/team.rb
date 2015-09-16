class Team < ActiveRecord::Base
	validates_presence_of :game_id, :team_name

	belongs_to :game
	has_many :team_memberships, dependent: :destroy
	has_many :players, through: :team_memberships
	has_many :team_strategies, dependent: :destroy
	has_many :players, through: :team_strategies
	has_many :projects
end
