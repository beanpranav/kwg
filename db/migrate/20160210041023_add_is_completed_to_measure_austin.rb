class AddIsCompletedToMeasureAustin < ActiveRecord::Migration
  def change
    add_column :measure_austins, :is_complete, :boolean, default: false
  end
end
