class CreateMeasureWorkloads < ActiveRecord::Migration
  def change
    create_table :measure_workloads do |t|
      t.integer :player_id
      t.boolean :is_complete, default: false
      t.integer :responses, :array => true

      t.timestamps
    end
  end
end
