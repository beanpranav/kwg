module GamesHelper

	def generate_project_name(index,teams)
    if teams > 1
      project_names[2+index]
    else
      project_names[index]
    end
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
      "vChat", "vPhotos", "vTunes", "vMaps", 
      "vGames", "vWeather", "vNews", "vMoney"
    ]
  end

  def colors
    [
      "White", "Blue", "Green", "Red", 
      "Purple", "Black", "Orange", "Yellow"
    ]
  end
  
end
