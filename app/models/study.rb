# rubocop:disable Metrics/LineLength
class Study < ActiveRecord::Base
  validates_presence_of :user_id, :title

  belongs_to :user
  has_many :games, dependent: :destroy

  def project_csv
    CSV.generate(headers: true) do |csv|
      csv << ['Study Title', 'Game Name', 'Game ID', 'Access Treatment',
              'MTM Variety', 'Team ID', 'Project ID', 'Profit']

      games.each do |game|
        game.projects.each do |prj|
          csv << [title, game.game_codename, game.id, game.access_treatement,
                  prj.team.projects.count == 1 ? 'High' : 'Low', prj.team_id, prj.id,
                  prj.profit_total.map { |_r, _e, profit| profit }.sum]
        end
      end
    end
  end
end
