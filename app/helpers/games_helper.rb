module GamesHelper
  def generate_project_name(index, teams)
    if teams > 2
      project_names[4 + index]
    else
      project_names[index]
    end
  end

  def generate_team_names(number)
    if number == 1
      ['Team_Vandelay']
    else
      colors.sample(number).map { |i| i.prepend('Vandelay_') }
    end
  end

  private

  def project_names
    [
      'vBooks', 'vMoney', 'vChat', 'vPhotos',
      'vTunes', 'vMaps', 'vGames', 'vWeather',
      'vChat', 'vPhotos', 'vBooks', 'vMoney',
      'vTaxi', 'vHotel', 'vNews', 'vInvest',
      'vFocus', 'vNotes', 'vMail', 'vFiles',
      'vFit', 'vBrowse', 'vCal', 'vReflect',
      'vClock', 'vRide', 'vDocs', 'vBank'
    ]
  end

  def colors
    [
      'White', 'Blue', 'Green', 'Red',
      'Purple', 'Black', 'Orange', 'Yellow',
      'Almond', 'Bone', 'Grey', 'Violet',
      'Capri', 'Cherry', 'Aero', 'Coral',
      'Indigo', 'Maroon', 'Corn', 'Jet'
    ]
  end
end
