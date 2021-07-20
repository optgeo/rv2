require 'json'
require './constants.rb'

while gets
  f = JSON.parse($_.strip)
  f['tippecanoe'] = {
    :layer => LAYER,
    :maxzoom => ENV['MAXZOOM'],
    :minzoom => ENV['MINZOOM']
  }
  print "\x1e#{JSON.dump(f)}\n"
end

