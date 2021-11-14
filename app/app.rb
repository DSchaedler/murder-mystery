class App
  attr_gtk
  attr_accessor :lmb, :rmb

  def initialize
    @checkbox ||= UICheckbox.new({ x: 100, y: 100, w: 16, h: 16, state: :checked_true })
    @lmb = LeftMouseButton.new
    @rmb = RightMouseButton.new
    
  end

  def tick
    @z_layer = Array.new(3) { [] }

    @checkbox.tick
    @z_layer[0] << @checkbox.draw

    z_draw(layers: @z_layer)
  end
end
