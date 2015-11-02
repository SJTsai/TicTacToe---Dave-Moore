require_relative 'human_player'
require_relative 'computer_player'

class GameSettings
  attr_reader :game_type, :first_player_type, :first_player_marker
  
  def initialize(game_type, first_player_type, first_player_marker)
    @game_type = game_type
    @first_player_type = first_player_type
    @first_player_marker = first_player_marker
  end
  
  public
  def first_player
    first_player_type = player_type_for_first_player(@game_type)
    if first_player_type == :Human
      return HumanPlayer.new(@first_player_marker)
    else
      return ComputerPlayer.new(@first_player_marker)
    end
  end
  
  private
  def player_type_for_first_player(game_type)
    if game_type == :HumanVersusHuman || game_type == :HumanVersusComputer
      return :Human
    elsif game_type == :ComputerVersusComputer
      return :Computer
    end
  end
  
  public
  def second_player
    second_player_type = player_type_for_second_player(@game_type)
    if second_player_type == :Human
      return HumanPlayer.new(marker_for_second_player(@first_player_marker))
    else
      return ComputerPlayer.new(marker_for_second_player(@first_player_marker))
    end
  end
  
  private
  def player_type_for_second_player(game_type)
    if game_type == :HumanVersusHuman
      return :Human
    elsif game_type == :HumanVersusComputer || game_type == :ComputerVersusComputer
      return :Computer
    end
  end
  
  private
  def marker_for_second_player(first_player_marker)
    return first_player_marker == :X ? :Y : :X
  end
end