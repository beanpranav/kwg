json.array!(@players) do |player|
  json.extract! player, :id, :user_id, :game_id, :salary_total, :skill_level, :skill_total_points
  json.url player_url(player, format: :json)
end
