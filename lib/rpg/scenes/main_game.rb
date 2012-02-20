module Rpg::Scenes
  class MainGame < Ray::Scene
    scene_name :main_game

    include Rpg::GameSceneBasics

    def path_of(res)
        File.expand_path File.join(File.dirname(__FILE__), res)
    end

    def setup
      @half_size = window.size / 2
      @sky  = sprite path_of("../resources/space.png")
      #@map  = Map.new path_of("../resources/map.txt")
      @sprite = sprite path_of("../resources/sprite.png")
      @sprite.sheet_size = [4, 4]
      @camera = Ray::View.new @sprite.pos, window.size
    end

    def clean_up
    end
  end
end
