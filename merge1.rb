require './constants.rb'

grids = Dir.glob("#{GRID_DIR}/*.mbtiles").
  map{|path| File.basename(path, '.mbtiles')[0..3]}
grids = grids.uniq ? grids.uniq : grids
grids.sort!

grids.each {|grid|
  files = Dir.glob("#{GRID_DIR}/#{grid}*.mbtiles")
  print "tile-join -f -o #{MERGE1_DIR}/#{grid}.mbtiles #{files.join(' ')}\n"
}


