module PlayersHelper

	def get_month_name(month_no)
    month_names[(month_no-1)%12]
  end

  def get_lewis_items(item_no)
    lewis_scale[item_no-1]
  end

  def get_likert_option(option_no)
    likert_options[option_no]
  end

  private

  def month_names
    [
      "JAN", "FEB", "MAR", "APR", "MAY", "JUN",
      "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
    ]
  end

  def lewis_scale
    [
      "1. Each team member has specialized knowledge of some aspect of our project.", 
      "2. I have knowledge about an aspect of the project that no other team member has.", 
      "3. Different team members are responsible for expertise in different areas.", 
      "4. The specialized knowledge of several different team members was needed to complete the project deliverables.",
      "5. I know which team members have expertise in specific areas.",
    
      "6. I was comfortable accepting procedural suggestions from other team members.", 
      "7. I trusted that other members’ knowledge about the project was credible.", 
      "8. I was confident relying on the information that other team members brought to the discussion.", 
      "9. When other members gave information, I wanted to double-check it for myself.", 
      "10. I did not have much faith in other members’“expertise.”",
    
      "11. Our team worked together in a well-coordinated fashion.", 
      "12. Our team had very few misunderstandings about what to do.", 
      "13. Our team needed to backtrack and start over a lot.", 
      "14. We accomplished the task smoothly and efficiently.",
      "15. There was much confusion about how we would accomplish the task."
    ]
  end

  def likert_options
    ["strongly disagree", "disagree", "neutral", "agree", "strongly agree"]
  end

end
