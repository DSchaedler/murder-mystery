def z_draw(layers:, debug: nil)
  args = $gtk.args
  args.outputs.primitives << layers if layers
  args.outputs.debug << debug if debug
end