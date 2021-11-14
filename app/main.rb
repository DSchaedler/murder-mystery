require 'app/app.rb'
require 'app/draw_handler.rb'
require 'app/register_sprite.rb'

require 'app/input/left_mouse_button.rb'
require 'app/input/right_mouse_button.rb'

require 'app/context/context_logic_graph.rb'

require 'app/ui/ui_checkbox.rb'

def tick args
  $app ||= App.new
  $app.args = args
  $app.tick
end
