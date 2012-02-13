module Rpg
  class Game < Ray::Game
    def initialize
      super "Awesome Game"

      Scenes::Title.bind(self)
      push_scene :title
    end

    def register
      add_hook :quit, method(:exit!)
    end
  end
end
