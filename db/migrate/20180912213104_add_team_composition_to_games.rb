class AddTeamCompositionToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :team_composition, :string, default: 'All Novices'
  end
end
