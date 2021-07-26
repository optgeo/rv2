require './constants.rb'

sources = Dir.glob("#{SRC_DIR}/*#{SRC_EXT}").map {|v| File.basename(v, SRC_EXT)}
sources.sort!

grids = Dir.glob("#{GRID_DIR}/*.mbtiles").map {|v| File.basename(v, ".mbtiles")}
grids.sort!

print "#{sources.size} -> #{grids.size} (#{(100.0 * grids.size / sources.size).to_i}%)\n"

unmatched = sources - grids

#p unmatched

