class AddIsCompletedToMeasureAustin < ActiveRecord::Migration[5.2]
  def change
    add_column :measure_austins, :is_complete, :boolean, default: false
  end
end
