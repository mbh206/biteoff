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

    if (!document.getElementById('custId').value) {
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
      const popup = new mapboxgl.Popup({ offset: 25 }).setHTML(`<a href="/special_offers/${marker.id}" class="pin-popup">${marker.name}<br>Special: ${marker.offer} | From: ${marker.starting}</a>`);

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  // #testMethod() {
  //   const markers = document.querySelectorAll(".marker")
  //   markers.forEach(marker  => {
  //     marker.addEventListener('click', (e) => {
  //       const card = document.getElementById(marker.id)
  //       console.log(card);

  //       card.scrollIntoView()
  //     })
  //   })
  // }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 50, maxZoom: 15, duration: 0 })
  }
}

  // Retrieve coordinates from the hidden input
