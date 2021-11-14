class RightMouseButton
  attr_accessor :up, :down

  def initialize
    @up = false
    @down = false
  end

  def tick
    args = $gtk.arg
    if args.inputs.button_right == false
      if @down == true
        @up = true
        @down = false
      else
        @up = false
        @down = false
      end
    end
    @down = true if args.inputs.button_right == true
  end
end
