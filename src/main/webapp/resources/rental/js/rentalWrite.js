$(document).ready(function() {
	
	document.getElementById("file_2").disabled = true;
	document.getElementById("file_3").disabled = true;
	document.getElementById("file_4").disabled = true;
	
	$('#file_1').change(function() {
		document.getElementById("file_2").disabled = false;
	});
	
	$('#file_2').change(function() {
		document.getElementById("file_3").disabled = false;
		file2 = $('#file_2').val();
		$('#file2').val(file2);
	});
	
	$('#file_3').change(function() {
		document.getElementById("file_4").disabled = false;
		file3 = $('#file_3').val();
		$('#file3').val(file3);
	});
	
	$('#file_4').change(function() {
		file4 = $('#file_4').val();
		$('#file4').val(file4);
	});
	
	$('form').submit(function(){
		if ($('#area').val() == '') {
			$('#area').focus();
			alert('면적을 입력하세요.');
			return false;
		}
		
		if ($('#price').val() == '') {
			$('#price').focus();
			alert('임대료를 입력하세요.');
			return false;
		}
		
		if ($('#file1').val() == '') {
			$('#file1').focus();
			alert('대표이미지를 선택하세요.');
			return false;
		}
		
		if ($('#content').val() == '') {
			$('#content').focus();
			alert('상세내용을 입력하세요.');
			return false;
		}
		
		if ($('#autocomplete').val() == '') {
			$('#autocomplete').focus();
			alert('주소를 입력하세요.');
			return false;
		}
		
		if ($('#markerLat').val() == '') {
			$('#markerLat').focus();
			alert('농장위치를 지도에 마킹해주세요.');
			return false;
		}
		
		var address = $('#autocomplete').val();
		var addArry = address.split(" ");
		if(addArry.length < 4 ){
			$('#autocomplete').focus();
			alert('주소를 상세하게 입력하세요.');
			return false;
		}
		
		
		
		
		
	});//submit()
	
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
	lat = location.lat();
	lng = location.lng()
	
}//addMarker()

//마킹 제거하는 함수
function removeMarker(){
	for(var i=0; i<pins.length; i++){
		pins[i].setMap(null);
	}
	pins = [];
}//removeMarker()

