#SRC_DIR = '/mnt/hdd/02_geotif'
SRC_DIR = '/mnt/hdd/sabun_src'
#SRC_EXT = '_sabun.tif'
SRC_EXT = '_sabun.asc'

W = 1125
H = 750

RESAMPLING_METHOD = {
  5 => 'q3',
  25 => 'q3',
  125 => 'max'
}

ZOOMS = {
  1 => {
    :maxzoom => 15,
    :minzoom => 15
  },
  5 => {
    :maxzoom => 14,
    :minzoom => 12 
  },
  25 => {
    :maxzoom => 11,
    :minzoom => 9 
  },
  125 => {
    :maxzoom => 8,
    :minzoom => 5
  }
}
MINZOOM = 5
MAXZOOM = 15

TMP_DIR = '/mnt/hdd/tmp'

GRID_DIR = 'grid'
MERGE1_DIR = 'merge1'

#TARGETS = /^(523950)/
#TARGETS = /^(523950|523940)/
#TARGETS = /^(5338|5339|5135|5132)/
TARGETS = /^(5132)/

LAYER = 'sabun'
PROPERTY = 'a'

BASE_URL = 'http://m354:9966'
OPACITY = 0.8

BASE_STYLE_URL = 'https://gsi-cyberjapan.github.io/gsivectortile-mapbox-gl-js/pale.json'

