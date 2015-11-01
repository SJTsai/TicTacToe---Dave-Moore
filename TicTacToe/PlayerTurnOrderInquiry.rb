class PlayerTurnOrderInquiry
  public
  def inquire_player_turn_order
    display_straightforward_inquiry
    user_option = get_user_option
    
    until is_valid_player_option?(user_option)
      display_wrong_input_inquiry
      user_option = get_user_option
    end
    
    return player_for_player_option(user_option)
  end
  
  private
  def display_straightforward_inquiry
    puts "Please choose who should go first:"
    display_player_options
    puts
  end
  
  private
  def display_player_options
    puts "(1) Player 1"
    puts "(2) Player 2"
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
    display_player_options
    puts
  end
  
  private
  def player_for_player_option(player_option)
    if player_option == "1"
      return :PlayerOne
    elsif player_option == "2"
      return :PlayerTwo
    end
  end
end
