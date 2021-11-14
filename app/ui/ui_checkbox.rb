class UICheckbox
  def initialize(options = {})
    @state = options[:state]
    @x = options[:x]
    @y = options[:y]
    @w = options[:w]
    @h = options[:h]
    @sprite = :nil

    @allowable_states = [:empty, :checked_true, :checked_false]
  end

  def tick
    args = $gtk.args
    if args.inputs.mouse.up.inside_rect? [@x, @y, @w, @h]
      case @state
      when :empty || :checked_false
        state = :checked_true
      when :checked_true
        state = :empty
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
    unless @sprite == :nil
      draw << {x: @x, y: @y}.merge(@sprite)
    end
    draw
  end
end
