module Rpg
  module List
    def elements
      @__list__elements ||= []
    end

    def current_element
      @__list__current_element
    end

    def select(idx)
      check_out_of_range(idx)

      elements.each_with_index do |element, index|
        if index == idx
          element.activate!
          self.current_element = element
        else
          element.deactivate!
        end
      end
    end

    def up
      select (current_index - 1 ) % elements.size
    end

    def down
      select (current_index + 1 ) % elements.size
    end

    private

    def current_element=(element)
      @__list__current_element = element
    end

    def current_index
      @__list__elements.index(@__list__current_element)
    end

    def check_out_of_range(idx)
      if idx < 0 || idx > elements.size
        raise ArgumentError, "Index out of range. Cannot select element #{idx} out of #{elements.size} elements."
      end
    end
  end
end
