class ChangeTableNames < ActiveRecord::Migration[5.2]
  def change
  	rename_table :memberships, :team_memberships
  end
end
