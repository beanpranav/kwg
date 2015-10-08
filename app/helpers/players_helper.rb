module PlayersHelper

	def get_month_name(month_no)
    month_names[(month_no-1)%12]
  end

  private

  def month_names
    [
      "JAN", "FEB", "MAR", "APR", "MAY", "JUN",
      "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
    ]
  end

end
