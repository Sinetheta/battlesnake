class Board
  def self.dimensions(board_info)
    [
      board_info.count,
      board_info.first.count
    ]
  end

  def self.direction_to_adjacent((x0, y0), (x1, y1))
    if x0 == x1
      if y0 < y1
        'down'
      else
        'up'
      end
    else
      if x0 < x1
        'right'
      else
        'left'
      end
    end
  end

  def initialize(board_info, snakes)
    @board_info = board_info
    @snakes = snakes
    @width, @height = Board.dimensions(board_info)
  end

  def find_snake(name)
    @snakes.find { |s| s.name == name }
  end

  def safe_adjacent_locations(location)
    adjacents(location).select(&self.method(:safe_location?))
  end

  private

  def adjacents((x, y))
    [
      [x + 1, y],
      [x - 1, y],
      [x,     y + 1],
      [x,     y - 1]
    ].select(&self.method(:valid_location?))
  end

  def safe_location?((x, y))
    @board_info[x][y]['snake'].nil?
  end


  def valid_location?((x, y))
    x.between?(0, @width - 1) && y.between?(0, @height - 1)
  end
end
