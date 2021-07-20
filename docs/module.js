import { YAML } from 'https://code4sabae.github.io/js/YAML.js'

const style = href => {
  const e = document.createElement('link')
  e.href = href
  e.rel = 'stylesheet'
  document.head.appendChild(e)
}

const script = src => {
  const e = document.createElement('script')
  e.src = src
  document.head.appendChild(e)
}

const init = () => {
  style('style.css')
  style('https://unpkg.com/maplibre-gl@1.15.2/dist/maplibre-gl.css')
  script('https://unpkg.com/maplibre-gl@1.15.2/dist/maplibre-gl.js')
  const map = document.createElement('div')
  map.id = 'map'
  document.body.appendChild(map)
}
init()

const showMap = async (texts) => {
  //mapboxgl.accessToken = 'pk.eyJ1IjoiaGZ1IiwiYSI6ImlRSGJVUTAifQ.rTx380smyvPc1gUfZv1cmw'
  const map = new maplibregl.Map({
    container: 'map',
    hash: true,
    style: 'style.json',
    maxZoom: 17.8
  })
  map.addControl(new maplibregl.NavigationControl())
  map.addControl(new maplibregl.ScaleControl({
    maxWidth: 200, unit: 'metric'
  }))

  let voice = null
  for(let v of speechSynthesis.getVoices()) {
    if (v.name == 'Kyoko') voice = v
  }

  map.on('load', () => {
    map.on('click', 'sabun', (e) => {
      let u = new SpeechSynthesisUtterance()
      u.lang = 'ja-JP'
      u.text = '差分は、' + (e.features[0].properties.a / 100) + "メートル"
      if (voice) u.voice = voice
      speechSynthesis.cancel()
      speechSynthesis.speak(u)
    })

/*
    map.on('moveend', () => {
      if (map.getZoom() < 14 && !speechSynthesis.speaking) {
        let u = new SpeechSynthesisUtterance()
	u.lang = 'ja-JP'
	u.text = '拡大してください。'
	if (voice) u.voice = voice
	speechSynthesis.cancel()
	speechSynthesis.speak(u)
      }
    })
*/
  })
}

const main = async () => {
  if (typeof maplibregl == 'undefined') {
    window.onload = () => {
      showMap()
    }
  } else {
    showMap()
  }
}
main()
