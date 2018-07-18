$(document).ready(function() {

	
});//ready()

var marker;
var pins = [];

//맵 초기화 함수	
function initMap(){
	var seoul = {			//서울 시청으로 처음 위치 지정
		lat : 37.566697,
		lng : 126.978457
	};
	
	map = new google.maps.Map(document.getElementById('map'), {
		zoom : 14,
		center : seoul,
		scrollwheel: true
	});
	
	//검색 자동완성 기능 
	var autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'));
	
	clickEvent = map.addListener('click', function(event){
		removeMarker();
		addMarker(event.latLng);
	});//addListener()
	
	//자동완성 주소 바꼈을 때 실행
	autocomplete.addListener('place_changed', function(){
		var place = autocomplete.getPlace();
		if(place.geometry){
			map.panTo(place.geometry.location);
			map.setZoom(15);
		}
	});//autocomplete.addListener()
	
}//initMap()
var lat;
var lng;
//마킹하는 함수
function addMarker(location){
	var marker = new google.maps.Marker({
        position: location,
        map: map
      });
	pins.push(marker);
	
	$('#markerLat').val(location.lat());
	$('#markerLng').val(location.lng());
	
}//addMarker()

//마킹 제거하는 함수
function removeMarker(){
	for(var i=0; i<pins.length; i++){
		pins[i].setMap(null);
	}
	pins = [];
}//removeMarker()

