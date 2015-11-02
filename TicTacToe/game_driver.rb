require_relative 'game_settings'
require_relative 'game_settings_inquiry'

class GameDriver
  public
  def start
    GameSettingsInquiry.new.inquire_about_game_settings do |game_type, first_player, first_player_marker|
      game_settings = GameSettings.new(game_type, first_player, first_player_marker)
    end
  end
end