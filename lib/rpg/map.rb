module Rpg
  class CollectibleGem
    include Ray::Helper

    def path_of(res)
      File.expand_path File.join(File.dirname(__FILE__), res)
    end

    def initialize(pos)
      @sprite = Ray::Sprite.new path_of('resources/gem.png'), :at => pos
      @sprite.origin = @sprite.image.size / 2

      @animation = rotation(:from => -30, :to => 30, :duration => 0.6)
      @reverse_animation = -@animation
    end

    def register(scene)
      self.event_runner = scene.event_runner
      @animation.event_runner = @reverse_animation.event_runner = event_runner

      on :animation_end, @animation do
        @reverse_animation.start @sprite
      end

      on :animation_end, @reverse_animation do
        @animation.start @sprite
      end

      @animation.start @sprite
    end

    def update
      @animation.update
      @reverse_animation.update
    end

    attr_reader :sprite
  end

  class Map
    def path_of(res)
      File.expand_path File.join(File.dirname(__FILE__), res)
    end

    PartSize = 60
    TileSize = 50

    def initialize(file)
      tileset  = path_of('resources/tileset.png')
      @tiles = {}
      @gems  = []

      File.foreach(file).with_index do |line, y|
        @max_y = y

        line.each_char.with_index do |char, x|
          @max_x = x

          case char
            when ?"
            @tiles[[x, y]] = Ray::Sprite.new(tileset, :at => [x * TileSize - 5,
            y * TileSize - 5])
            @tiles[[x, y]].sub_rect = [0, 0, PartSize, PartSize]
            when ?#
            @tiles[[x, y]] = Ray::Sprite.new(tileset, :at => [x * TileSize - 5,
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
