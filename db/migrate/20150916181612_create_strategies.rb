class CreateStrategies < ActiveRecord::Migration
  def change
    create_table :strategies do |t|
      t.integer :team_id
      t.integer :player_id
      t.string :strategy_statement

      t.timestamps
    end
  end
end
