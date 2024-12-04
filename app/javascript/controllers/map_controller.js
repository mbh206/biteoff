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

      // Get the pin style based on the category
      const categoryPinStyles = {
        "Themed Restaurant": '<i class="fa-solid fa-masks-theater"></i>',
        "Soba Noodles": '<i class="fa-solid fa-bowl-rice"></i>',
        "Sushi": '<i class="fa-solid fa-fish"></i>',
        "Ramen": '<i class="fa-solid fa-bowl-hot"></i>',
        "Unagi": '<i class="fa-solid fa-fish"></i>',
        "Italian": '<i class="fa-solid fa-pizza-slice"></i>',
        "Kaiseki": '<i class="fa-solid fa-leaf"></i>',
        "Tempura": '<i class="fa-solid fa-shrimp"></i>',
        "Molecular Gastronomy": '<i class="fa-solid fa-flask"></i>',
        "Teppanyaki": '<i class="fa-solid fa-fire"></i>',
        "French": '<i class="fa-solid fa-cheese"></i>',
        "Chinese": '<i class="fa-solid fa-bowl-rice"></i>',
        "Sukiyaki": '<i class="fa-solid fa-hotpot"></i>',
        "Okonomiyaki": '<i class="fa-solid fa-pancakes"></i>',
        "Japanese Sweets": '<i class="fa-solid fa-ice-cream"></i>',
        "Western-Japanese Fusion": '<i class="fa-solid fa-utensils"></i>',
        "Café": '<i class="fa-solid fa-mug-saucer"></i>',
        "Bakery/Café": '<i class="fa-solid fa-bread-slice"></i>',
        "Melon Pan Bakery": '<i class="fa-solid fa-bread-slice"></i>',
        "Yakiniku": '<i class="fa-solid fa-fire"></i>',
        "Tonkatsu": '<i class="fa-solid fa-piggy-bank"></i>',
        "Kushikatsu": '<i class="fa-solid fa-utensils"></i>',
        "Gyoza": '<i class="fa-solid fa-cookie-bite"></i>',
        "Japanese": '<i class="fa-solid fa-utensils"></i>',
        "Seafood": '<i class="fa-solid fa-fish"></i>',
        "Tofu Kaiseki": '<i class="fa-solid fa-leaf"></i>',
        "Horumon": '<i class="fa-solid fa-drumstick-bite"></i>',
        "Brewery/International": '<i class="fa-solid fa-beer-mug-empty"></i>',
        "Pizza": '<i class="fa-solid fa-pizza-slice"></i>',
        "Japanese Fusion": '<i class="fa-solid fa-utensils"></i>',
        "Yakitori": '<i class="fa-solid fa-drumstick-bite"></i>',
        "Sukiyaki": '<i class="fa-solid fa-hotpot"></i>',
        "Gyoza": '<i class="fa-solid fa-dumpling"></i>',
        "Seafood": '<i class="fa-solid fa-fish"></i>',
        "Horumon": '<i class="fa-solid fa-fire"></i>',
        "Yakitori": '<i class="fa-solid fa-drumstick-bite"></i>',
        "Pizza": '<i class="fa-solid fa-pizza-slice"></i>',
        "Brewery/International": '<i class="fa-solid fa-beer-mug-empty"></i>',
        "Café": '<i class="fa-solid fa-mug-saucer"></i>',
        "Japanese Fusion": '<i class="fa-solid fa-utensils"></i>',
      };
      const pinStyle = categoryPinStyles[marker.category] || '<i class="fa-solid fa-map-pin"></i>'; // Default icon if category not found

      // Create a custom marker element
      const customMarker = document.createElement("div");
      customMarker.className = "pins badge text-primary";
      customMarker.innerHTML = pinStyle;
      customMarker.onclick = function() { document.getElementById(marker.id).scrollIntoView() }

      // Add the marker to the map
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);

      });
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
    this.map.fitBounds(bounds, { padding: 20, maxZoom: 15, duration: 0 })
  }
}
