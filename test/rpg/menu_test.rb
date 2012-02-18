require 'test_helper'

module Rpg
  describe Menu do
    before do
      @parent = Positionable::Root
      @menu   = Menu.new(@parent)
    end

    it 'is positionable' do
      Menu.ancestors.must_include Positionable
    end

    it 'is a list' do
      Menu.ancestors.must_include List
    end

    describe '#push' do
      it 'adds an option to the menu' do
        @menu.push "Foo"
        @menu.elements.size.must_equal 1
      end
    end

    describe '#render' do
      before do
        @renderable = Class.new do
          def rendered; @rendered; end
          def render(win)
            @rendered = win
          end
        end
      end

      it 'renders each option into a window' do
        foo    = @renderable.new
        bar    = @renderable.new
        window = Object.new

        @menu.elements << foo
        @menu.elements << bar

        @menu.render(window)

        foo.rendered.must_equal window
        bar.rendered.must_equal window
      end
    end
  end
end

