require 'app/app.rb'

require 'app/context_logic_graph.rb'

require 'app/ui/ui_checkbox.rb'

def tick args
  $app ||= App.new
  $app.args = args
  $app.tick
end
