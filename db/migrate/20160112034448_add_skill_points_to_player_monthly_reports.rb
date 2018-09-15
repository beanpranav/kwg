class AddSkillPointsToPlayerMonthlyReports < ActiveRecord::Migration[5.2]
  def change
    add_column :player_monthly_reports, :skill_points_generated_1, :integer, default: 0
    add_column :player_monthly_reports, :skill_points_generated_2, :integer, default: 0
    add_column :player_monthly_reports, :skill_points_generated_3, :integer, default: 0
    add_column :player_monthly_reports, :skill_points_generated_4, :integer, default: 0
  end
end
