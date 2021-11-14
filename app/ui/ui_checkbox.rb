class UICheckbox
  def initialize(options = {})
    @state = options[:state]
    @x = options[:x]
    @y = options[:y]
    @w = options[:w]
    @h = options[:h]
    @sprite = :nil

    @allowable_states = %i[empty true false]
  end

  def tick
    args = $gtk.args
    if args.inputs.mouse.up.inside_rect? [@x, @y, @w, @h]
      case @state
      when :empty || :false
        state = true
      when :true
        state = :empty
      end
    end

    case @state
    when :false
      @sprite = FALSE_MARK
    when :true
      @sprite = TRUE_MARK
    when :empty
      @sprite = :nil
    end

  end

  def draw
    draw = []
    draw <<{ x: @x, y: @y, w: @w, h: @h }.border!
    unless @sprite == :nil
      draw << {x: @x, y: @y}.merge(@sprite)
    end
    draw
  end
end
