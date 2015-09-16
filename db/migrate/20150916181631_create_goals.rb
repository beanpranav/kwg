class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :project_id
      t.integer :player_id
      t.string :goal_statement

      t.timestamps
    end
  end
end
