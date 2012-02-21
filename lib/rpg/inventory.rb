module Rpg
  class Inventory
    def initialize
      @entries = []
    end

    def add(name, amount=1)
      entry = find(name)

      unless entry.null?
        return entry.increase(amount)
      end

      @entries << Entry.new(name, amount)
    end

    def find(name)
      @entries.detect { |entry| entry.name == name } || Entry.null(name)
    end

    def remove(name, amount=1)
      entry = find(name)
      entry.decrease(amount)
      @entries.delete(entry) if entry.empty?
    end

    private

    class Entry
      attr_reader :amount

      def self.null(name)
        NullEntry.new(name)
      end
      def null?; false; end

      def initialize(object, amount)
        @object = object
        @amount = amount
      end

      def name
        @object
      end

      def increase(amount=1)
        @amount += amount
      end

      def decrease(amount=1)
        check_enough!(amount)
        @amount -= amount
      end

      def empty?
        @amount.zero?
      end

      private

      def check_enough!(amount)
        raise ArgumentError, "Tried to remove #{amount} of #{name}, but got only #{@amount}" if @amount < amount
      end

      class NullEntry < Struct.new(:name)
        def null?; true; end;

        def decrease(*args)
          raise StandardError, "Called #decrease on a null entry (#{name})."
        end
      end
    end
  end
end
