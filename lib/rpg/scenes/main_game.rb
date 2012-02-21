module Rpg::Scenes
  class MainGame < Ray::Scene
    scene_name :main_game

    include Rpg::GameSceneBasics

    def setup
      @half_size = window.size / 2
      @sky  = sprite path_of("space.png")
      @map  = Rpg::Map.new path_of("map.txt")
      @sprite = sprite path_of("sprite.png")
      @sprite.sheet_size = [4, 4]
      @camera = Ray::View.new @sprite.pos, window.size
    end

    def clean_up
    end
  end
end
