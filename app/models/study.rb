# rubocop:disable Metrics/LineLength
class Study < ActiveRecord::Base
  validates_presence_of :user_id, :title

  belongs_to :user
  has_many :games, dependent: :destroy

  def project_csv
    CSV.generate(headers: true) do |csv|
      csv << ['Study Title', 'Game Name', 'Game ID', 'Access Treatment',
              'MTM Variety', 'Team ID', 'Project ID', 'Project Name',
              'Project Date', 'Player IDs', 'Profit',
              'Lewis Measures P1', 'Lewis Measures P2', 'Lewis Measures P3']

      games.sort_by(&:id).each do |game|
        game.projects.each do |prj|
          # lewis = prj.team.measure_lewis.sort_by(&:id).map { |m| m.responses_specialization.sum + m.responses_credibility.sum + m.responses_coordination.sum }
          lewis_specialization = prj.team.measure_lewis.sort_by(&:id).map { |m| m.responses_specialization.sum }
          lewis_credibility = prj.team.measure_lewis.sort_by(&:id).map { |m| m.responses_credibility.sum }
          lewis_coordination = prj.team.measure_lewis.sort_by(&:id).map { |m| m.responses_coordination.sum }
          
          prj_profit = prj.profit_total.map { |_r, _e, profit| profit }.sum
          csv << [
            title,
            game.game_codename,
            game.id,
            game.access_treatement,
            prj.team.projects.count == 1 ? 'High' : 'Low',
            prj.team_id,
            prj.id,
            prj.project_name,
            prj.updated_at.strftime('%Y-%m-%d'),
            prj.team.players.sort_by(&:member_no).map(&:id),
            prj_profit.to_f / 1000,
            [lewis_specialization[0], lewis_credibility[0], lewis_coordination[0]],
            [lewis_specialization[1], lewis_credibility[1], lewis_coordination[1]],
            [lewis_specialization[2], lewis_credibility[2], lewis_coordination[2]]
          ]
        end
      end
    end
  end

  def player_csv
    CSV.generate(headers: true) do |csv|
      csv << ['Study Title', 'Game Name', 'Game ID', 'Access Treatment',
              'MTM Variety', 'Player ID', 'Player Name', 'Player Date', 'Gender', 'Age', 'Tut Attempts',
              'Salary', 'Skill levels', 'Workload Measure', 'Austin Skill 1 levels',
              'Austin Skill 2 levels', 'Austin Skill 3 levels', 'Austin Skill 4 levels']

      games.sort_by(&:id).each do |game|
        game.players.sort_by(&:member_no).each do |p|
          csv << [
            title,
            game.game_codename,
            game.id,
            game.access_treatement,
            p.teams.count == 1 ? 'Low' : 'High',
            p.id,
            p.player_screenname.gsub("@", ""),
            p.updated_at.strftime('%Y-%m-%d'),
            p.gender,
            p.age,
            p.failed_attempt_count,
            p.salary_total,
            p.skill_level,
            p.measure_workload.responses.sum,
            p.measure_austin.skill_1_player_levels,
            p.measure_austin.skill_2_player_levels,
            p.measure_austin.skill_3_player_levels,
            p.measure_austin.skill_4_player_levels
          ]
        end
      end
    end
  end
end
