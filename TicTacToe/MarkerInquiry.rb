class MarkerInquiry
  public
  def inquire_marker_for_first_player
    display_straightforward_inquiry
    user_option = get_user_option
    
    until is_valid_player_option?(user_option)
      display_wrong_input_inquiry
      user_option = get_user_option
    end
    
    return marker_for_marker_option(user_option)
  end
  
  private
  def display_straightforward_inquiry
    puts "Please choose a marker for the first player:"
    display_marker_options
    puts 
  end
  
  private
  def display_marker_options
    puts "(1) X"
    puts "(2) O"
  end
  
  private
  def get_user_option
    user_option = gets.chomp
    puts
    return user_option  
  end
  
  private
  def is_valid_player_option?(player_option)
    return player_option == "1" || player_option == "2"
  end
  
  private
  def display_wrong_input_inquiry
    puts "You must choose 1 or 2."
    display_marker_options
    puts
  end
  
  private
  def marker_for_marker_option(marker_option)
    if marker_option == "1"
      return :X
    elsif marker_option == "2"
      return :O
    end
  end
end