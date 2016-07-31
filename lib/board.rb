require './lib/tile'

class Board
  attr_reader :tiles

  def initialize(snakes_info, board_info)
    @snakes = snakes_info.map { |s| Snake.new(s) }
    @tiles = board_info.enum_for(:each_with_index).map do |column, x|
      column.enum_for(:each_with_index).map do |tile_info, y|
        Tile.new(x, y, tile_info['state'], self)
      end
    end
  end

  def find_snake(name)
    @snakes.find { |s| s.name == name }
  end

  def get_tile((x, y))
    @tiles[x] && @tiles[x][y]
  end
end
