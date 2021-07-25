#
# RUNNING MODE
#

# Produce grid-wise mbtiles only
GRID_ONLY = false

#
# DIRECTORIES
#

# Source data directory
SRC_DIR = '/mnt/hdd/sabun_src'
# Source data filename extensions
SRC_EXT = '_sabun.asc'
# Temporary directory
TMP_DIR = '/mnt/ramdisk'

GRID_DIR = 'grid'

MERGE1_DIR = 'merge1'
# Path of the single mbtiles file
SINGLE_MBTILES = 'tiles.mbtiles'

#
# SOURCE DATA SPECIFICATIONS
#

# Width in pixels
W = 1125
# Height in pixels
H = 750

#
# RESAMPING PARAMETERS
# 

RESAMPLING_METHOD = {
  5 => 'q3',
  25 => 'q3',
  125 => 'q3'
}

#
# VECTOR TILE DESIGN
#
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

LAYER = 'sabun'
PROPERTY = 'a'
MASK_LAYER = 'mask'
MASK_PROPERTY = 'a'


#
# TARGETS OF PRODUCTION
#

#TARGETS = /^(523950)/
#TARGETS = /^(523950|523940)/
#TARGETS = /^(5132)/
#TARGETS = /^(5338|5339|5135|5132)/
#TARGETS = /^(5338|5339|5035|5135|5132)/
#TARGETS = /^(30|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|5238|5239|5240|5340|5438|5439|5440)/
TARGETS = /^(5332|5333|5334|5335)/

#
# STYLE DESIGN
# 

#BASE_URL = 'http://m354:9966'
BASE_URL = 'http://126.74.62.65'
#BASE_URL = 'http://163.42.60.188:9966/all'

SABUN_OPACITY = 1
PHOTO_OPACITY = 0.5
BASE_STYLE_URL = 'https://gsi-cyberjapan.github.io/gsivectortile-mapbox-gl-js/pale.json'
BACKGROUND_COLOR = 'rgb(255, 255, 255)'
MASK_COLOR = 'rgb(189, 189, 189)'
