require_relative 'GameTypeInquiry'
require_relative 'MarkerInquiry'
require_relative 'PlayerTurnOrderInquiry'

class GameSettingsInquiry
  public
  def inquire_about_game_settings
    game_type = GameTypeInquiry.new.inquire_game_type
    first_player = PlayerTurnOrderInquiry.new.inquire_about_first_player
    marker_for_first_player = MarkerInquiry.new.inquire_marker_for_first_player
    yield(game_type, first_player, marker_for_first_player)
  end
end