class UICheckbox
  attr_accessor args, state

  def initialize(options = {})
    @state = options[:state]
    @x = options[:x]
    @y = options[:y]
    @w = options[:w]
    @h = options[:h]

    @allowable_states = %i[empty true false]
  end

  def tick
    puts checkbox clicked if args.state.mouse.up.inside_rect? [@x, @y, @w, @h]
  end

  def draw
    { x: @x, y: @y, w: @w, h: @h }.border!
  end
end
