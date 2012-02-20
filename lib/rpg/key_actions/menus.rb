module Rpg::MenuKeys
  def menu_movement
    on :key_press, key(:up) do
      @menu.up
    end

    on :key_press, key(:down) do
      @menu.down
    end

    on :key_press, key(:return) do
      @menu.current_element.run
    end
  end
end
