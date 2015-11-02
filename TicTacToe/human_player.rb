require_relative 'player'

class HumanPlayer
  include Player
  
  attr_reader :marker
  
  def initialize(marker)
    @marker = marker
  end
end