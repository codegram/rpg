module Rpg::Scenes
  class Map
    def path_of(res)
      File.expand_path File.join(File.dirname(__FILE__), res)
    end

    Tileset  = path_of("CptnRuby Tileset.png")
    PartSize = 60
    TileSize = 50

    def initialize(file)
      @tiles = {}
      @gems  = []

      File.foreach(file).with_index do |line, y|
        @max_y = y

        line.each_char.with_index do |char, x|
          @max_x = x

          case char
            when ?"
            @tiles[[x, y]] = Ray::Sprite.new(Tileset, :at => [x * TileSize - 5,
            y * TileSize - 5])
            @tiles[[x, y]].sub_rect = [0, 0, PartSize, PartSize]
            when ?#
            @tiles[[x, y]] = Ray::Sprite.new(Tileset, :at => [x * TileSize - 5,
            y * TileSize - 5])
            @tiles[[x, y]].sub_rect = [PartSize, 0, PartSize, PartSize]
            when ?x
            @gems << CollectibleGem.new([x * TileSize + TileSize / 2,
            y * TileSize + TileSize / 2])
          end
        end
      end

      @max_x *= TileSize
      @max_y *= TileSize
    end

    def each_tile
      @tiles.each { |_, tile| yield tile }
    end

    def each_gem(&block)
      @gems.each(&block)
    end

    def remove_gems(&block)
      @gems.delete_if(&block)
    end

    def solid?(x, y)
      y < 0 || @tiles[[x.to_i / TileSize, y.to_i / TileSize]]
    end

    attr_reader :max_x, :max_y
  end
end
