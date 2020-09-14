import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "contentBox", "googleMap" ]

  initialize() {
    this.wellContent = "";
  }

  performances() {
    this.toggleIfNeeded("performances");
    this.fetchAndFillPerformance();
  }

  map() {
    this.toggleIfNeeded("map");
    if (!this.hasGoogleMapTarget) {
      this.initMap();
    }
  }

  initMap() {
    this.fillContent('<div data-target="button-bar.googleMap" style="width:100%;height:400px;"></div>');
    var position = {lat: parseFloat(this.element.dataset.latitude), lng: parseFloat(this.element.dataset.longitude)}

    const mapProps = {
      center: position,
      zoom: 15,
      mapTypeControlOptions: {
        mapTypeIds: ["styled_map"]
      }
    };

    const map = new google.maps.Map( this.googleMapTarget, mapProps);
    const marker = new google.maps.Marker({position: position, map: map});

    map.setOptions({
      disableDefaultUI: false,
      fullScreenControl: true,
      panControl: true,
      zoomControl: true,
      mapTypeControl: false,
      scaleControl: false,
      streetViewControl: true,
      overviewMapControl: true,
      rotateControl: true
    });

    map.mapTypes.set('styled_map', this.styledMapType());
    map.setMapTypeId('styled_map');

  }

  fetchAndFillPerformance() {
    $.get("/performances/" + this.element.dataset.eventId).done((data) => {
      this.fillContent(data);
    })
  }

  toggleIfNeeded(newWellContent) {
    if (this.wellContent === newWellContent || this.wellContent === "") {
      $(this.contentBoxTarget).collapse('toggle');
    }

    if (this.wellContent === newWellContent) {
      this.wellContent = ""
      this.contentBoxTarget.innerHTML = "";
    } else {
      this.wellContent = newWellContent;
    }
  }

  fillContent(data) {
    this.contentBoxTarget.innerHTML = data
  }

  styledMapType() {
   return new google.maps.StyledMapType(
    [
    {
      "elementType": "geometry",
      "stylers": [
      {
        "color": "#ebe3cd"
      }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
      {
        "color": "#523735"
      }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
      {
        "color": "#f5f1e6"
      }
      ]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry.stroke",
      "stylers": [
      {
        "color": "#c9b2a6"
      }
      ]
    },
    {
      "featureType": "administrative.land_parcel",
      "elementType": "geometry.stroke",
      "stylers": [
      {
        "color": "#dcd2be"
      }
      ]
    },
    {
      "featureType": "administrative.land_parcel",
      "elementType": "labels.text.fill",
      "stylers": [
      {
        "color": "#ae9e90"
      }
      ]
    },
    {
      "featureType": "landscape.natural",
      "elementType": "geometry",
      "stylers": [
      {
        "color": "#dfd2ae"
      }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
      {
        "color": "#dfd2ae"
      }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
      {
        "color": "#93817c"
      }
      ]
    },
    {
      "featureType": "poi.attraction",
      "elementType": "geometry.fill",
      "stylers": [
      {
        "visibility": "on"
      }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry.fill",
      "stylers": [
      {
        "color": "#a5b076"
      }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
      {
        "color": "#447530"
      }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
      {
        "color": "#f5f1e6"
      }
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "geometry",
      "stylers": [
      {
        "color": "#fdfcf8"
      }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
      {
        "color": "#f8c967"
      }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry.stroke",
      "stylers": [
      {
        "color": "#e9bc62"
      }
      ]
    },
    {
      "featureType": "road.highway.controlled_access",
      "elementType": "geometry",
      "stylers": [
      {
        "color": "#e98d58"
      }
      ]
    },
    {
      "featureType": "road.highway.controlled_access",
      "elementType": "geometry.stroke",
      "stylers": [
      {
        "color": "#db8555"
      }
      ]
    },
    {
      "featureType": "road.local",
      "elementType": "labels.text.fill",
      "stylers": [
      {
        "color": "#806b63"
      }
      ]
    },
    {
      "featureType": "transit.line",
      "elementType": "geometry",
      "stylers": [
      {
        "color": "#dfd2ae"
      }
      ]
    },
    {
      "featureType": "transit.line",
      "elementType": "labels.text.fill",
      "stylers": [
      {
        "color": "#8f7d77"
      }
      ]
    },
    {
      "featureType": "transit.line",
      "elementType": "labels.text.stroke",
      "stylers": [
      {
        "color": "#ebe3cd"
      }
      ]
    },
    {
      "featureType": "transit.station",
      "elementType": "geometry",
      "stylers": [
      {
        "color": "#dfd2ae"
      }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry.fill",
      "stylers": [
      {
        "color": "#b9d3c2"
      }
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
      {
        "color": "#92998d"
      }
      ]
    }
    ],
    {name: 'Styled Map'}
  );
 }
}


