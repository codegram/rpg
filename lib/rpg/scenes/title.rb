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
          push_scene :options
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

    class Options < Ray::Scene
      scene_name :options
      include Rpg::Positionable

      def setup
        @parent = Rpg::Positionable::Root

        @menu = Rpg::Menu.new(self) do |menu|
          menu.pos(self.x + 100, self.y + 150)
          menu.push "Option 1" do
            puts "option 1!"
          end

          menu.push "Option 2" do
            puts "option 2!"
          end

          menu.push "Back" do
            pop_scene
          end

          menu.select(2)
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
        @menu.render(win)
      end
    end
  end
end
