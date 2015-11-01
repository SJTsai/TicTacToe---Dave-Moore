class GameSettings
  attr_reader :game_type, :first_player, :first_player_marker
  
  def initialize(game_type, first_player, first_player_marker)
    @game_type = game_type
    @first_player = first_player
    @first_player_marker = first_player_marker
  end
end