module Rpg
  class Menu::Option
    def initialize(parent, text, number, &block)
      pos = calculate_position(parent, number)
      @text = Ray::Text.new(text, :size => 20, :at => pos)
      @code = block
    end

    def render(win)
      win.draw @text
    end

    def activate!
      @text.color = Ray::Color.red
    end

    def deactivate!
      @text.color = Ray::Color.white
    end

    def run(*args)
      @code.call(*args)
    end

    private

    def calculate_position(parent, number)
      x = parent.x + 100
      y = parent.y + (number * 30)
      [x, y]
    end
  end
end
