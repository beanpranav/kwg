module GamesHelper

	def generate_project_name
    rnd1 = Random.rand(51)
    rnd2 = Random.rand(60)
    rnd3 = Random.rand(4)

    "#{adjectives[rnd1+rnd3]}_#{nouns[rnd2+rnd3]}"
  end

  def generate_team_names(number)
    colors.sample(number).map{|i| i.prepend("Team_")}
  end

  private

  def adjectives
    [
      "autumn", "hidden", "bitter", "misty", "silent", "empty", "dry", "dark",
      "summer", "icy", "delicate", "quiet",  "cool", "spring", "winter",
      "patient", "twilight", "dawn", "wispy", "weathered", 
      "billowing", "broken", "cold", "damp", "falling", "frosty", 
      "long", "late", "bold", "little", "morning", "muddy",
      "rough", "still", "small", "sparkling", "shy",
      "wandering", "withered", "wild", "young", "holy", "solitary",
      "fragrant", "aged", "snowy", "proud", "floral", "restless",
      "polished", "lively", "nameless", "olive", "indigo", "chocolate"
    ]
  end

  def nouns
    [
      "waterfall", "river", "breeze", "moon", "rain", "wind", "sea", "morning",
      "snow", "lake", "sunset", "pine", "shadow", "leaf", "dawn", "glitter",
      "forest", "hill", "cloud", "meadow", "sun", "glade", "bird", "brook",
      "butterfly", "bush", "dew", "dust", "field", "fire", "flower", "firefly",
      "feather", "grass", "haze", "mountain", "night", "pond", "darkness",
      "snowflake", "silence", "sound", "sky", "shape", "surf", "thunder",
      "violet", "water", "wildflower", "wave", "water", "resonance", "sun",
      "wood", "dream", "cherry", "tree", "fog", "frost", "voice", "paper",
      "frog", "smoke", "star"
    ]
  end

  def colors
    [
      "White", "Blue", "Green", "Red", "Purple", "Black", "Crimson", 
      "Ivory", "Orange", "Silver", "Pink", "Gray", "Yellow", "Silver"
    ]
  end
  
end
