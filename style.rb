require 'yaml'
require 'json'
require './constants.rb'

metadata = JSON.parse(File.open('docs/zxy/metadata.json').read)
center = metadata['center'].split(',').map {|v| v.to_f}

gsi_style = JSON.parse($stdin.read)

style = <<-EOS
version: 8
center: #{center[0..1]}
zoom: #{center[2].to_i}
sprite: #{gsi_style['sprite']}
glyphs: #{gsi_style['glyphs']}
sources: 
  v: 
    type: vector
    minzoom: #{MINZOOM}
    maxzoom: #{MAXZOOM}
    attribution: M Project
    tiles: 
      - #{BASE_URL}/zxy/{z}/{x}/{y}.pbf
  i:
    type: raster
    minzoom: 2
    maxzoom: 18
    attribution: 国土地理院
    tileSize: 256
    tiles:
      - https://maps.gsi.go.jp/xyz/seamlessphoto/{z}/{x}/{y}.jpg
layers: 
  -
    id: background
    type: background
    paint: 
      background-color: #{BACKGROUND_COLOR}
  - 
    id: sabun
    type: fill
    source: v
    source-layer: sabun
    minzoom: #{MINZOOM}
    maxzoom: 18
    paint: 
      fill-color: 
        - step
        -
          - get
          - a
        - rgba(255, 255, 255, 0)
        - 1000
        - rgba(255, 128, 128, #{SABUN_OPACITY})
        - 1500
        - rgba(217, 74, 117, #{SABUN_OPACITY})
        - 2000
        - rgba(181, 0, 103, #{SABUN_OPACITY})
      fill-outline-color: rgba(0, 0, 0, 0)
  -
    id: mask
    type: fill
    source: v
    source-layer: mask
    minzoom: #{ZOOMS[1][:minzoom]}
    maxzoom: 18
    paint:
      fill-color: 
        - case 
        -
          - '>'
          -
            - get
            - a
          - 1000
        - rgba(0, 0, 0, 0)
        - #{MASK_COLOR}
      fill-outline-color: rgba(0, 0, 0, 0)
  - 
    id: seamlessphoto
    type: raster
    source: i
    paint:
      raster-opacity: #{PHOTO_OPACITY}
EOS

style = YAML.load(style)

style['sources'].merge!(gsi_style['sources'])
gsi_style['layers'].each {|layer|
  layer.delete('metadata')
  style['layers'].insert(-1, layer)
}

print JSON.pretty_generate(style)

