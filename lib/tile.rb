class Tile
  attr_reader :x, :y

  def initialize(x, y, state, board)
    @x = x
    @y = y
    @state = state
    @board = board
  end

  def empty?
    @state == "empty"
  end

  def food?
    @state == "food"
  end

  def snake?
    @state == "head" || @state == "body"
  end

  def safe?
    food? || empty?
  end

  def walkable_neighbours
    adjacents.select(&:safe?)
  end

  def direction_from_location((x0, y0))
    if x0 == x
      if y0 < y
        'down'
      else
        'up'
      end
    else
      if x0 < x
        'right'
      else
        'left'
      end
    end
  end

  private

  def adjacents
    @adjacents ||= [
      [x + 1, y],
      [x - 1, y],
      [x,     y + 1],
      [x,     y - 1]
    ].map { |location| @board.get_tile(location) }.compact
  end
end
