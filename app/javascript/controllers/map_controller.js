import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"


// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    // this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl }))

  }

  markersValueChanged() {
    if (this.markersValue.length > 0) {
      mapboxgl.accessToken = this.apiKeyValue

      this.map = new mapboxgl.Map({
        container: this.element,
        style: "mapbox://styles/mapbox/streets-v10"
      })
      this.#addMarkersToMap()
      this.#fitMapToMarkers()
    }
    console.log("Updating markers")
  }

  #addMarkersToMap() {
    this.markers ||= []
    this.markers.forEach(marker => marker.remove())
    this.markers = []

    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const mapboxMarker = new mapboxgl.Marker({"color": "#CA78B0"})

      mapboxMarker.setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)

      this.markers.push(mapboxMarker)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    console.log(this.markersValue.length)
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}
