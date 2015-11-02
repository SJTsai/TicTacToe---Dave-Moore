require_relative 'Spot'

module Player
  def marker
    return :X
  end
  
  def get_spot_for_next_move
    return Spot.new(0, 0)
  end
end