import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    console.log(this.markersValue);

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12"
    })
    const geolocate = new mapboxgl.GeolocateControl({
      positionOptions: {
          enableHighAccuracy: true
      }
    });
    this.map.addControl(geolocate);

    if (!localStorage.getItem("long") && !localStorage.getItem("lat")) {
      this.map.on('load', () => {
          geolocate.trigger();
      });
    }

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    const coordinates = document.getElementById('custId').value.replace(/\[/g, '');
    const [latitude, longitude] = coordinates.split(',').map(coord => parseFloat(coord));
    console.log(latitude)
    console.log(longitude)

    if (latitude && longitude) {
      this.map.setCenter([longitude, latitude]);
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popupBox = `<a href="/special_offers/${marker.id}" class="pin-popup">
                      ${marker.name}<br>Special: ${marker.offer}<br>From: ${marker.starting}
                      </a>`
      const popup = new mapboxgl.Popup({ offset: 25 }).setHTML(popupBox);

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
      })
      const marker2 = `<div class="pins badge text-dark">
                        <i class="fa-solid fa-person-walking"></i>
                      </div>`
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker2
      new mapboxgl.Marker(customMarker)
        .setLngLat([ localStorage.getItem("long"), localStorage.getItem("lat") ])
        .addTo(this.map)
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 40, maxZoom: 10, duration: 0 })
  }
}
