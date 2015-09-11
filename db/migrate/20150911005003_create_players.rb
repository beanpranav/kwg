class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :salary_total
      t.integer :skill_level, :array => true, :length => 4, :default => '{0,0,0,0}'
      t.integer :skill_total_points, :array => true, :length => 4, :default => '{0,0,0,0}'

      t.timestamps
    end
  end
end
