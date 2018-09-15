class CreateMeasureLewis < ActiveRecord::Migration[5.2]
  def change
    create_table :measure_lewis do |t|
      t.integer :player_id
      t.boolean :is_complete, default: false
      t.integer :responses_specialization, :array => true
      t.integer :responses_credibility, :array => true
      t.integer :responses_coordination, :array => true

      t.timestamps
    end
  end
end
