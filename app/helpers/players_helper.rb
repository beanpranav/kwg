module PlayersHelper

	def get_month_name(month_no)
    month_names[(month_no-1)%12]
  end

  def get_lewis_items(item_no)
    lewis_scale[item_no]
  end

  def get_likert_option(option_no)
    likert_options[option_no]
  end

  def get_workload_items(item_no)
    workload_scale[item_no]
  end

  def get_high_low_likert_option(option_no)
    high_low_likert_options[option_no]
  end

  private

  def month_names
    [
      "JAN", "FEB", "MAR", "APR", "MAY", "JUN",
      "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
    ]
  end

  def lewis_scale
    {
      1 =>  "6. Each team member has specialized skills for some aspect of our project.", 
      2 =>  "4. I have skills about an aspect of the project that no other team member has.", 
      3 =>  "3. Different team members are responsible for expertise in different areas.", 
      4 =>  "9. The specialized skills of different team members was needed to complete the project.",
      5 =>  "11. I know which team members have expertise in specific areas.",
    
      6 =>  "14. I was comfortable accepting procedural suggestions from other team members.", 
      7 =>  "2. I trusted that other members’ knowledge about the project was credible.", 
      8 =>  "5. I was confident relying on the information that other members brought to the discussion.", 
      9 =>  "13. When other members gave information, I wanted to double-check it for myself.", 
      10 =>  "10. I did not have much faith in other members’ “expertise.”",
    
      11 =>  "1. Our team worked together in a well-coordinated fashion.", 
      12 =>  "12. Our team had very few misunderstandings about what to do.", 
      13 =>  "7. Our team needed to backtrack and start over a lot.", 
      14 =>  "15. We accomplished the task smoothly and efficiently.",
      15 =>  "8. There was much confusion about how we would accomplish the task."
    }
  end

  def likert_options
    ["strongly disagree", "disagree", "neutral", "agree", "strongly agree"]
  end

  def workload_scale
    {
      1 =>  "(Mental Demand) --> How mentally demanding was the task?", 
      2 =>  "(Temporal Demand) --> How hurried or rushed was the pace of the task?", 
      3 =>  "(Performance) --> How successful were you in accomplishing the task?", 
      4 =>  "(Effort) --> How hard did you have to work to accomplish your level of performance?",
      5 =>  "(Frustration) --> How insecure, discouraged, irritated, stressed, or annoyed were you?",
    }
  end

  def high_low_likert_options
    ["very low", "low", "neutral", "high", "very high"]
  end

end
