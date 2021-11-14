class App

  def initialize
    @args = $gtk.args 
  end

  def tick
    @args = $gtk.args
    @z_layer = Array.new(3) { [] }

    checkbox = UICheckbox.new({x: 100, y: 100, w: 16, h: 16})
    checkbox.tick
    @z_layer[0] << checkbox.draw

    z_draw(layers: @z_layer)
  end
end
