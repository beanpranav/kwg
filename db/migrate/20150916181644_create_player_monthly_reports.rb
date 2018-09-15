class CreatePlayerMonthlyReports < ActiveRecord::Migration[5.2]
  def change
    create_table :player_monthly_reports do |t|
      t.integer :player_id
      t.integer :salary_generated
      t.integer :skill_points_generated, :array => true

      t.timestamps
    end
  end
end
