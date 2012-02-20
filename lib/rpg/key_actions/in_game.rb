module Rpg::InGameKeys
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

    center_camera
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
