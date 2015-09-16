class CreateProjectMonthlyReports < ActiveRecord::Migration
  def change
    create_table :project_monthly_reports do |t|
      t.integer :project_id
      t.integer :profit_generated, :array => true
      t.integer :stats_generated, :array => true
      t.integer :rd_generated, :array => true
      t.integer :users_generated

      t.timestamps
    end
  end
end
