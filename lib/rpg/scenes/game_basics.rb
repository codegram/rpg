module Rpg::GameSceneBasics
  include Rpg::InGameKeys

  def center_camera
    #camera_x = [[@sprite.x, @half_size.w].max, @map.max_x - @half_size.w].min
    #camera_y = [[@sprite.y, @half_size.h].max, @map.max_y - @half_size.h].min
    camera_x = [[@sprite.x, @half_size.w].max, @half_size.w].min
    camera_y = [[@sprite.y, @half_size.h].max, @half_size.h].min

    @camera.center = [camera_x, camera_y]
  end

  def register
    in_game_options
  end

  def render(win)
    always
    win.draw @sky

    win.with_view @camera do # Apply scrolling
      win.draw @sprite
    end
  end

  def always
    movement
  end
end
