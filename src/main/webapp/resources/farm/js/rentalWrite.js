$(document).ready(function() {

	alert('js');
	
	
}); //ready

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
}	