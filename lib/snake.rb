require 'astar'
require './lib/board'

class Snake
  attr_reader :name

  def initialize(options)
    @name = options['name']
    @coords = options['coords']
  end

  def next_move(board)
    binding.pry
    if safe_next_tiles(board).any?
      safe_next_tiles(board).first.direction_from_location(head_location)
    else
      'up'
    end
  end

  private

  def head_location
    @coords.first
  end

  def safe_next_tiles(board)
    @snt ||= board.get_tile(head_location).walkable_neighbours
  end
end
