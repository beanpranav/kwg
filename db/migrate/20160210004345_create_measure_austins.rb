class CreateMeasureAustins < ActiveRecord::Migration[5.2]
  def change
    create_table :measure_austins do |t|
      t.integer :player_id
      t.integer :skill_1_player_levels, :array => true
      t.integer :skill_2_player_levels, :array => true
      t.integer :skill_3_player_levels, :array => true
      t.integer :skill_4_player_levels, :array => true

      t.timestamps
    end
  end
end
