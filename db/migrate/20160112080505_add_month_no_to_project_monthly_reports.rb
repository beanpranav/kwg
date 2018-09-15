class AddMonthNoToProjectMonthlyReports < ActiveRecord::Migration[5.2]
  def change
    add_column :project_monthly_reports, :month_no, :integer
  end
end
