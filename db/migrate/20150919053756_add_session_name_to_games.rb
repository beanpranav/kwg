class AddSessionNameToGames < ActiveRecord::Migration
  def change
    add_column :games, :session_name, :string
    add_column :games, :game_codename, :string
  end
end
