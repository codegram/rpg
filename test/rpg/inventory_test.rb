require 'test_helper'

module Rpg
  describe Inventory do
    before do
      @inventory = Inventory.new
    end

    describe '#add' do
      describe 'if the entry is already in the inventory' do
        before do
          @inventory.add(:nugget)
        end

        it 'increases it by 1 by default' do
          @inventory.add(:nugget)
          @inventory.find(:nugget).amount.must_equal 2
        end
      end

      describe 'otherwise' do
        it 'creates a new entry and appends it to the inventory' do
          @inventory.add(:nugget)
          @inventory.find(:nugget).amount.must_equal 1
        end
      end

      describe 'when specifying an optional amount' do
        it 'increases it by a certain amount if specified' do
          @inventory.add(:nugget, 100)
          @inventory.find(:nugget).amount.must_equal 100
        end
      end
    end

    describe '#find' do
      describe 'if the entry is in the inventory' do
        it 'returns it' do
          @inventory.add(:nugget)
          nugget = @inventory.find(:nugget)
          nugget.name.must_equal :nugget
          nugget.amount.must_equal 1
        end
      end

      describe 'otherwise' do
        it 'returns a null entry' do
          @inventory.find(:whatever).null?.must_equal true
        end
      end
    end

    describe '#remove' do
      describe 'when the entry exists' do
        before do
          @inventory.add(:nugget, 3)
        end

        describe 'and it has a sufficient amount to remove' do
          it 'removes that amount from the entry' do
            @inventory.remove(:nugget, 2)
            @inventory.find(:nugget).amount.must_equal 1
          end
        end

        describe 'and it has the exact amount to remove' do
          it 'removes itself from the inventory' do
            @inventory.remove(:nugget, 3)
            @inventory.find(:nugget).null?.must_equal true
          end
        end

        describe 'and it does not have a sufficient amount to remove' do
          it 'raises an exception' do
            lambda {
              @inventory.remove(:nugget, 100)
            }.must_raise ArgumentError
          end
        end
      end

      describe 'otherwise' do
        it 'raises an exception' do
          lambda {
            @inventory.remove(:whatever)
          }.must_raise StandardError
        end
      end
    end
  end
end
