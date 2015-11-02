class GameSettings
  attr_reader :game_type, :first_player, :first_player_marker
  
  def initialize(game_type, first_player, first_player_marker)
    @game_type = game_type
    @first_player = first_player
    @first_player_marker = first_player_marker
  end
  
  public
  def player_type_for_first_player
    if game_type == :HumanVersusHuman || game_type == :HumanVersusComputer
      return :Human
    elsif game_type == :ComputerVersusComputer
      return :Computer
    end
  end
  
  public
  def player_type_for_second_player
    if game_type == :HumanVersusHuman
      return :Human
    elsif game_type == :HumanVersusComputer || game_type == :ComputerVersusComputer
      return :Computer
    end
  end
end