require 'test_helper'

module Rpg
  describe Menu::Option do
    before do
      @parent = Positionable::Root
      @called = false

      @option = Menu::Option.new(@parent, "Foo", 0) do
        @called = true
      end

      def @option.text; @text; end
    end

    describe '#activate!' do
      it 'highlights the option' do
        @option.activate!
        @option.text.color.must_equal Ray::Color.red
      end
    end

    describe '#deactivate!' do
      it 'unhighlights the option' do
        @option.deactivate!
        @option.text.color.must_equal Ray::Color.white
      end
    end

    describe '#run' do
      it 'runs the option code' do
        @option.run
        @called.must_equal true
      end
    end

    describe '#render' do
      it 'renders the text into a window' do
        window = MiniTest::Mock.new
        window.expect(:draw, nil, [@option.text])

        @option.render(window)

        window.verify.must_equal true
      end
    end
  end
end
