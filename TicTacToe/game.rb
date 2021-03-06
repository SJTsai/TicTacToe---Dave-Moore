require_relative 'game_settings'
require_relative 'player'

class Game
  def initialize(game_settings)    
    @player_one = game_settings.first_player
    @player_two = game_settings.second_player
    
    if game_settings.first_player_type == :PlayerOne
      @current_player = @player_one
    else
      @current_player = @player_two
    end
  end

  def start_game
    puts "Welcome to my Tic Tac Toe game"
    display_board(@board)
    puts "Please select your spot."
    until game_is_over(@board) || tie(@board)
      get_human_spot
      if !game_is_over(@board) && !tie(@board)
        eval_board
      end
      display_board(@board)
    end
    puts "Game over"
  end
  
  def display_board(board)
    puts "|_#{board[0]}_|_#{board[1]}_|_#{board[2]}_|\n|_#{board[3]}_|_#{board[4]}_|_#{board[5]}_|\n|_#{board[6]}_|_#{board[7]}_|_#{board[8]}_|\n"
  end

  def get_human_spot
    spot = nil
    until spot
      spot = gets.chomp.to_i
      if @board[spot] != "X" && @board[spot] != "O"
        @board[spot] = @human_marker
      else
        spot = nil
      end
    end
  end

  def eval_board
    spot = nil
    until spot
      if is_center_spot_empty?(@board)
        spot = 4
        @board[spot] = @computer_marker
      else
        spot = get_best_move(@board, @computer_marker)
        if is_spot_empty_on_board?(spot, @board)
          @board[spot] = @computer_marker
        else
          spot = nil
        end
      end
    end
  end
  
  def is_center_spot_empty?(board)
    is_spot_empty_on_board?(4, board)
  end
  
  def is_spot_empty_on_board?(spot, board)
    board[spot] == spot.to_s
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces.each do |as|
      board[as.to_i] = @computer_marker
      if game_is_over(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @human_marker
        if game_is_over(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  def game_is_over(b)

    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end

  def tie(b)
    b.all? { |s| s == "X" || s == "O" }
  end

end
