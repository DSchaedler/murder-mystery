require 'app/app.rb'

def tick args
  $app ||= App.new
  $app.args = args
  $app.tick
end
