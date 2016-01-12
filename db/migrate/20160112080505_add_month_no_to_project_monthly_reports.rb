class AddMonthNoToProjectMonthlyReports < ActiveRecord::Migration
  def change
    add_column :project_monthly_reports, :month_no, :integer
  end
end
