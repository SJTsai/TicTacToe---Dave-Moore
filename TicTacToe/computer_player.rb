require_relative 'player'

class ComputerPlayer
  include Player
  
  attr_reader :marker
  
  def initialize(marker)
    @marker = marker
  end
end