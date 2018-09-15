class AddMonthNoToPlayerMonthlyReports < ActiveRecord::Migration[5.2]
  def change
    add_column :player_monthly_reports, :month_no, :integer
    add_column :games, :is_paused, :boolean
  end
end
