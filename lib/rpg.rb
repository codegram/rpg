require 'ray'
require "rpg/version"
require "rpg/scenes/title"
require "rpg/game"

module Rpg
  def self.run
    Game.new.run
  end
end
