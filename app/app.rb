class App
  attr_gtk
  attr_accessor :lmb, :rmb

  def initialize
    starting_pos_x = 100
    starting_pos_y = 100
    
    @checkboxes = []
    
    num_x = 9
    while num_x > 0
      num_y = 9
      while num_y > 0
        @checkboxes << UICheckbox.new({ x: starting_pos_x + (num_x * 16), y: starting_pos_y + (num_y* 16), w: 16, h: 16, state: :empty })
        num_y -= 1
      end
      num_x -= 1
    end
    @lmb = LeftMouseButton.new
    @rmb = RightMouseButton.new
  end

  def tick
    @z_layer = Array.new(3) { [] }
    @lmb.tick
    @rmb.tick

    @checkboxes.each do |checkbox|
      checkbox.tick
    end
    @checkboxes.each do |checkbox|
      @z_layer[0] << checkbox.draw
    end

    z_draw(layers: @z_layer)
  end
end
