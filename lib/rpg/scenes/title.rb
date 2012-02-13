module Rpg::Scenes
  class Title < Ray::Scene
    scene_name :title

    def setup
      @text = text "Welcome to RPG!", :size => 30
    end

    def register
    end

    def render(win)
      win.draw @text
    end

    def clean_up
    end
  end
end
