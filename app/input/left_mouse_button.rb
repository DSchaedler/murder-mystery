class LeftMouseButton
  attr_accessor :up, :down

  def initialize
    @up = false
    @down = false
  end

  def tick
    args = $gtk.args
    if args.inputs.mouse.button_left == false
      if @down == true
        @up = true
        @down = false
      else
        @up = false
        @down = false
      end
    end
    @down = true if args.inputs.mouse.button_left == true
  end
end
