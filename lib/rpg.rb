require 'ray'
require "rpg/positionable"
require "rpg/list"
require "rpg/version"
require "rpg/scenes/title"

require "rpg/menu"
require "rpg/menu/option"

require "rpg/game"

module Rpg
  def self.run
    Game.new.run
  end
end
