require_relative 'game_type_inquiry'
require_relative 'marker_inquiry'
require_relative 'player_turn_order_inquiry'

class GameSettingsInquiry
  public
  def inquire_about_game_settings
    game_type = GameTypeInquiry.new.inquire_game_type
    first_player = PlayerTurnOrderInquiry.new.inquire_about_first_player
    marker_for_first_player = MarkerInquiry.new.inquire_marker_for_first_player
    yield(game_type, first_player, marker_for_first_player)
  end
end