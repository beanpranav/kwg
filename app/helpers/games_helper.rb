module GamesHelper

	def generate_project_name(index)
    project_names[index]
  end

  def generate_team_names(number)
    if number == 1 
      ["Team_Vandeley"]
    else
      colors.sample(number).map{|i| i.prepend("Vandeley_")}
    end
  end

  private

  def project_names
    [
      "vChat", "vGames", "vTunes", "vMaps", 
      "vPhotos", "vWeather", "vNews", "vMoney"
    ]
  end

  def colors
    [
      "White", "Blue", "Green", "Red", 
      "Purple", "Black", "Orange", "Yellow"
    ]
  end
  
end
