// Initialize and add the map
function initMap() {
  // The location of Uluru
  var company = {lat: 35.654, lng: 139.695};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 4, center: company});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: company, map: map});
}