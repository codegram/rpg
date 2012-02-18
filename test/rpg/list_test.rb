require 'test_helper'

module Rpg
  describe List do
    before do
      @list = Class.new {
        include List
      }.new

      @element_class = Class.new {
        def active?
          !!@active
        end

        def activate!
          @active = true
        end

        def deactivate!
          @active = false
        end
      }

      @foo = @element_class.new
      @bar = @element_class.new
      @baz = @element_class.new

      @list.elements << @foo
      @list.elements << @bar
      @list.elements << @baz
    end

    describe '#select' do
      it 'selects a given element by its index' do
        @list.select 0
        @list.current_element.must_equal @foo
      end

      it 'activates the current element' do
        @list.select 0
        @foo.active?.must_equal true
      end

      it 'deactivates the other elements element' do
        @list.select 0
        @bar.active?.must_equal false
        @baz.active?.must_equal false
      end

      it 'complains when the index is out of range' do
        lambda {
          @list.select 99
        }.must_raise ArgumentError
      end
    end

    describe '#up' do
      describe 'when we are at the top of the list' do
        it 'wraps to the last element' do
          @list.select(0)
          @list.up
          @list.current_element.must_equal @baz
        end
      end

      describe 'when we are at any other position' do
        it 'goes up one element' do
          @list.select(2)
          @list.up
          @list.current_element.must_equal @bar
        end
      end
    end

    describe '#down' do
      describe 'when we are at the bottom of the list' do
        it 'wraps to the first element' do
          @list.select(2)
          @list.down
          @list.current_element.must_equal @foo
        end
      end

      describe 'when we are at any other position' do
        it 'goes down one element' do
          @list.select(0)
          @list.down
          @list.current_element.must_equal @bar
        end
      end
    end
  end
end
