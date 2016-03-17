class AddTeamIdToMeasureLewis < ActiveRecord::Migration
  def change
    add_column :measure_lewis, :team_id, :integer
  end
end
