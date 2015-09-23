class Game < ActiveRecord::Base
	validates_presence_of :user_id, :game_type, :game_length, :game_status, :session_name, :game_codename

	has_many :players, dependent: :destroy
	has_many :users, through: :players

	has_many :teams, dependent: :destroy
	has_many :projects, dependent: :destroy
end
