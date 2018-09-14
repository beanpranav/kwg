class AddCohesionToLewis < ActiveRecord::Migration
  def change
    add_column :measure_lewis, :responses_group_attraction, :integer, array: true, default: []
    add_column :measure_lewis, :responses_group_integration, :integer, array: true, default: []
  end
end
