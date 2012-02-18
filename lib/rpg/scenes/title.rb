module Rpg::Scenes
  class Title < Ray::Scene
    scene_name :title

    include Rpg::Positionable

    def setup
      @parent = Rpg::Positionable::Root
      @text = text "Welcome to RPG!", :size => 30, :at => [x + 50, y + 20]

      @menu = Rpg::Menu.new(self) do |menu|
        menu.pos(self.x + 100, self.y + 150)
        menu.push "Start" do
          puts "start!"
        end

        menu.push "Options" do
          puts "options!"
        end

        menu.push "End" do
          exit(1)
        end

        menu.select(0)
      end

      on :key_press, key(:up) do
        @menu.up
      end

      on :key_press, key(:down) do
        @menu.down
      end

      on :key_press, key(:a) do
        @menu.current_element.run
      end
    end

    def register
    end

    def render(win)
      win.draw @text
      @menu.render(win)
    end

    def clean_up
    end
  end
end
