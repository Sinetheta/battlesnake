require './lib/board'

class Snake
  attr_reader :name

  def initialize(options)
    @name = options['name']
    @coords = options['coords']
  end

  def next_move(board)
    if safe_next_locations(board).any?
      Board.direction_to_adjacent(head_location, safe_next_locations(board).first)
    else
      'up'
    end
  end

  private

  def head_location
    @coords.first
  end

  def safe_next_locations(board)
    @snl ||= board.safe_adjacent_locations(head_location)
  end
end
