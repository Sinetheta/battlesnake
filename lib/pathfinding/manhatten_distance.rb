module Walking
  class ManhattenDistance
    def self.score(tile)
      new(tile).score
    end

    def relative_to_parent
      return 10 if (@tile.x > @tile.parent.x && @tile.y == @tile.parent.y)
      return 10 if (@tile.x < @tile.parent.x && @tile.y == @tile.parent.y)
      return 10 if (@tile.y > @tile.parent.y && @tile.x == @tile.parent.x)
      return 10 if (@tile.y < @tile.parent.y && @tile.x == @tile.parent.x)
      14
    end

    private

    def initialize(tile)
      @tile = tile
    end

    def score
      f = relative_to_parent
      g = (@tile.destination.x - @tile.x).abs + (@tile.destination.y - @tile.y).abs
      f + g
    end
  end
end
