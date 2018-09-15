class AddSessionNameToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :session_name, :string
    add_column :games, :game_codename, :string
  end
end
