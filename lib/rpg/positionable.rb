module Rpg
  module Positionable
    attr_writer :x, :y

    def x
      @x || @parent.x
    end

    def y
      @y || @parent.y
    end

    def pos(x, y)
      @x, @y = x, y
    end

    Root = Object.new.tap do |obj|
      obj.extend Positionable
      obj.pos 0, 0
    end
  end

end
