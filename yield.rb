require './constants.rb'
require 'find'

Find.find(SRC_DIR) {|path|
  next unless path.end_with?(SRC_EXT)
  fn = File.basename(path, SRC_EXT)
  next unless TARGETS.match(fn)
  if File.exist?("#{GRID_DIR}/#{fn}.mbtiles") and
    !File.exist?("#{GRID_DIR}/#{fn}.mbtiles-journal")
    #$stderr.print "Skipping #{GRID_DIR}/#{fn}.mbtiles\n"
  else
    print fn, "\n"
  end
}
