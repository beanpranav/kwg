class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :team_id
      t.integer :game_id
      t.integer :stats_total, :array => true
      t.integer :rnd_stage, :array => true
      t.integer :rnd_total_points, :array => true
      t.integer :profit_total, :array => true
      t.integer :users_total

      t.timestamps
    end
  end
end
