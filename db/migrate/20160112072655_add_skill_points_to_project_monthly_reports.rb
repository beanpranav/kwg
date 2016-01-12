class AddSkillPointsToProjectMonthlyReports < ActiveRecord::Migration
  def change
    add_column :project_monthly_reports, :expense_generated, :integer, default: 0
    add_column :project_monthly_reports, :skill_1_stats_generated, :integer, default: 0
    add_column :project_monthly_reports, :skill_2_stats_generated, :integer, default: 0
    add_column :project_monthly_reports, :skill_3_stats_generated, :integer, default: 0
    add_column :project_monthly_reports, :skill_4_stats_1_generated, :integer, default: 0
    add_column :project_monthly_reports, :skill_4_stats_2_generated, :integer, default: 0
    add_column :project_monthly_reports, :skill_4_stats_3_generated, :integer, default: 0
    remove_column :project_monthly_reports, :profit_generated
    remove_column :project_monthly_reports, :stats_generated
    remove_column :project_monthly_reports, :rd_generated
    remove_column :project_monthly_reports, :users_generated
    remove_column :player_monthly_reports, :skill_points_generated
  end
end
