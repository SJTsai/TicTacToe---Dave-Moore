class GameTypeInquiry
  public
  def inquire_game_type
    display_straightforward_inquiry
    user_option = get_user_option
    
    until is_valid_option?(user_option)
      display_wrong_input_inquiry
      user_option = get_user_option
    end
    
    return game_type_for_option(user_option)
  end
  
  private
  def display_straightforward_inquiry
    puts "Please choose a game type:"
    display_game_type_options
    puts 
  end
  
  private
  def display_game_type_options
    puts "(1) Human vs. Human"
    puts "(2) Human vs. Computer"
    puts "(3) Computer vs. Computer"
  end
  
  private
  def get_user_option
    user_option = gets.chomp
    puts
    return user_option  
  end
  
  private
  def is_valid_option?(option)
    return option == "1" || option == "2" || option == "3"
  end
  
  private
  def display_wrong_input_inquiry
    puts "You must choose 1, 2, or 3."
    display_game_type_options
    puts
  end
  
  private
  def game_type_for_option(option)
    if option == "1"
      return :HumanVersusHuman
    elsif option == "2"
      return :HumanVersusComputer
    elsif option == "3"
      return :ComputerVersusComputer
    end
  end
end

