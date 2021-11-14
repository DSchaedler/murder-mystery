class UICheckbox
  def initialize(options = {})
    @state = options[:state]
    @x = options[:x]
    @y = options[:y]
    @w = options[:w]
    @h = options[:h]
    @sprite = :nil

    @allowable_states = %i[empty checked_true checked_false]
  end

  def tick
    args = $gtk.args
    if args.inputs.mouse.up && args.geometry.inside_rect?([args.inputs.mouse.x, args.inputs.mouse.y, 1, 1], [@x, @y, @w, @h])
      puts "checkbox clicked"
      case @state
      when :empty || :checked_false
        @state = :checked_true
      when :checked_true
        @state = :empty
      end
    end

    case @state
    when :checked_false
      @sprite = FALSE_MARK
    when :checked_true
      @sprite = TRUE_MARK
    when :empty
      @sprite = :nil
    end
  end

  def draw
    draw = []
    draw << { x: @x, y: @y, w: @w, h: @h }.border!
    draw << { x: @x, y: @y }.merge(@sprite) unless @sprite == :nil
    draw
  end
end
