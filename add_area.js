const geojsonArea = require('@mapbox/geojson-area')
const split = require('split')

process.stdin.pipe(split())
  .on('data', f => {
    if (!f) return
    f = JSON.parse(f)
    if (f.properties.a == 0) return
    f.properties.a = Math.round(geojsonArea.geometry(f.geometry))
    f.tippecanoe = {
      layer: 'mask',
      minzoom: 15,
      maxzoom: 15
    }
    console.log(JSON.stringify(f))
  })
