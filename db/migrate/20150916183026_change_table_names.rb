class ChangeTableNames < ActiveRecord::Migration
  def change
  	rename_table :goals, :project_goals
  	rename_table :strategies, :team_strategies
  	rename_table :memberships, :team_memberships
  end
end
