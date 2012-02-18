require 'test_helper'

module Rpg
  describe Positionable do
    before do
      @object = Class.new {
        include Positionable
        def initialize
          @parent = Positionable::Root
          @x = 100
          @y = 200
        end
      }.new
    end

    describe '#x' do
      describe 'if it has an x coordinate' do
        it 'returns it' do
          @object.x.must_equal 100
        end
      end
      describe 'if not, but it has a parent' do
        it "returns the parent's x" do
          @object.x = nil
          @object.x.must_equal 0
        end
      end
    end

    describe '#y' do
      describe 'if it has an y coordinate' do
        it 'returns it' do
          @object.y.must_equal 200
        end
      end
      describe 'if not, but it has a parent' do
        it "returns the parent's y" do
          @object.y = nil
          @object.y.must_equal 0
        end
      end
    end

    describe '#pos' do
      it 'sets x and y at once' do
        @object.pos(1,2)
        @object.x.must_equal 1
        @object.y.must_equal 2
      end
    end

    describe Positionable::Root do
      before do
        @root = Positionable::Root
      end

      it 'is a toplevel positionable object' do
        @root.x.must_equal 0
        @root.y.must_equal 0
      end
    end
  end
end
