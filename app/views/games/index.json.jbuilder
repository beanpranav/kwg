json.array!(@games) do |game|
  json.extract! game, :id, :user_id, :game_type, :game_length, :game_status, :access_treatement
  json.url game_url(game, format: :json)
end
