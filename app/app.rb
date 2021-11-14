class App
  attr_accessor args, z_layer

  def initialize; end

  def tick
    @z_layer = Array.new(3) { [] }

    checkbox = UICheckbox.new({ x: 100, y: 100, w: 16, h: 16 })
    checkbox.tick
    @z_layer[0] << checkbox.draw

    z_draw(layers: @z_layer)
  end
end
