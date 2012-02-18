module Rpg
  class Menu
    include Positionable
    include List

    def initialize(parent)
      @parent  = parent
      yield self if block_given?
    end

    def push(text, &block)
      number = elements.size
      elements << Option.new(self, text, number, &block)
    end

    def render(win)
      elements.each do |option|
        option.render win
      end
    end
  end
end
