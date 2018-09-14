class AddTeamCompositionToGames < ActiveRecord::Migration
  def change
    add_column :games, :team_composition, :string, default: 'All Novices'
  end
end
