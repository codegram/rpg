require 'ray'
require "rpg/positionable"
require "rpg/key_actions/in_game"
require "rpg/key_actions/menus"
require "rpg/scenes/game_basics"
require "rpg/list"
require "rpg/version"
require "rpg/scenes/title"
require "rpg/map"
require "rpg/scenes/main_game"

require "rpg/menu"
require "rpg/menu/option"

require "rpg/game"

module Rpg
  def self.run
    Game.new.run
  end
end
