class AddTeamIdToMeasureLewis < ActiveRecord::Migration[5.2]
  def change
    add_column :measure_lewis, :team_id, :integer
  end
end
