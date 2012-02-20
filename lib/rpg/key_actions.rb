module Rpg::KeyActions
  def in_game_options
    on :key_press, key(:escape) do
      run_scene :options
    end
  end

  def movement
    if animations.empty?
      if holding? :down
        move_towards :down
      elsif holding? :left
        move_towards :left
      elsif holding? :right
        move_towards :right
      elsif holding? :up
        move_towards :up
      end
    end

    # Center camera
    #camera_x = [[@sprite.x, @half_size.w].max, @map.max_x - @half_size.w].min
    #camera_y = [[@sprite.y, @half_size.h].max, @map.max_y - @half_size.h].min
    camera_x = [[@sprite.x, @half_size.w].max, @half_size.w].min
    camera_y = [[@sprite.y, @half_size.h].max, @half_size.h].min

    @camera.center = [camera_x, camera_y]
  end

  def move_towards(dir)
    case dir
      when :up
        from  = [0, 3]
        to    = [4, 3]
        of    = [0, -32]
      when :down
        from  = [0, 0]
        to    = [4, 0]
        of    = [0, 32]
      when :right
        from  = [0, 2]
        to    = [4, 2]
        of    = [32, 0]
      when :left
        from  = [0, 1]
        to    = [4, 1]
        of    = [-32, 0]
    end

    animations << sprite_animation(:from => from, :to => to,
                                   :duration => 0.3).start(@sprite)
    animations << translation(:of => of, :duration => 0.3).start(@sprite)
  end
end
