#SRC_DIR = '/mnt/hdd/02_geotif'
SRC_DIR = '/mnt/hdd/sabun_src'
#SRC_EXT = '_sabun.tif'
SRC_EXT = '_sabun.asc'

W = 1125
H = 750

RESAMPLING_METHOD = {
  5 => 'q3',
  25 => 'q3',
  125 => 'q3'
}

ZOOMS = {
  1 => {
    :maxzoom => 15,
    :minzoom => 15
  },
  5 => {
    :maxzoom => 14,
    :minzoom => 13
  },
  25 => {
    :maxzoom => 12,
    :minzoom => 10
  },
  125 => {
    :maxzoom => 9,
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
SABUN_OPACITY = 1
PHOTO_OPACITY = 0.5

BASE_STYLE_URL = 'https://gsi-cyberjapan.github.io/gsivectortile-mapbox-gl-js/pale.json'

