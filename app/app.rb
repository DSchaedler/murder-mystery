class App
  attr_gtk
  attr_accessor :lmb, :rmb

  def initialize
    num_x = 9
    num_y = 9
    starting_pos_x = 100
    starting_pos_y = 100
    @checkboxes = []
    num_x.times do |x|
      num_y.times do |y|
        checkboxes << UICheckbox.new({ x: starting_pos_x + (x * 16), y: starting_pos_y + (x* 16), w: 16, h: 16, state: :checked_true })
      end
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
    @checkboxes.each do |checkbox
      @z_layer[0] << checkbox.draw
    end

    z_draw(layers: @z_layer)
  end
end
