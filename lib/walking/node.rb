module Walking
  class Node
    attr_reader :tile, :parent, :destination

    def initialize(tile, destination, parent=nil)
      @tile = tile
      @destination = destination
      @parent = parent
    end

    def walkable_neighbours
      @tile.walkable_neighbours
    end

    def x
      @tile.x
    end

    def y
      @tile.y
    end
  end
end
