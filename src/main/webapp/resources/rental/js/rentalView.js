$(document).ready(function() {

});//ready()

/* 맵 필드 변수 설정 */
var marker;
var pins = [];
var map;

/* 맵 초기화 함수 */	
function initMap(){
	var LAT = $('#lat').val() * 1.0;
	var LNG = $('#lng').val() * 1.0;
	
	var position = {			
		lat :  LAT,
		lng :  LNG	
	};
	
	map = new google.maps.Map(document.getElementById("map"), {
		zoom : 14,
		center : position,
		scrollwheel: true
	});
	
	var marker = new google.maps.Marker({
        position: position,
        map: map
      });
	pins.push(marker);
	
}//initMap()
