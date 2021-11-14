class ContextLogicGraph
  attr_accessor args

  def initialize
    @args = $gtk.args
  end

  def tick; end
end
