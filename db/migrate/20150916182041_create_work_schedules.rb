class CreateWorkSchedules < ActiveRecord::Migration
  def change
    create_table :work_schedules do |t|
      t.integer :player_monthly_report_id
      t.integer :project_monthly_report_id
      t.integer :rank
      t.string :skill_use

      t.timestamps
    end
  end
end
