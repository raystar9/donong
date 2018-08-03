$(document).ready(function() {
	
	/* 파일 선택 시 행 추가 */
	$('#file1').change(function() {
		var inputfile=$(this).val().split('\\');
		var extension = $(this).val().split('.');
		if(extension[1] != "png" && extension[1] != "PNG" &&
		   extension[1] != "jpg" && extension[1] != "jpeg"	){
			alert('이미지를 올려주세요.');
			$('#flie1').val("");
			$('#filevalue1').val("");
		}else{
			$("#filevalue1").text(inputfile[inputfile.length-1]);
			$('#file2_tr').css('display','table-row');
		}
	});
	
	$('#file2').change(function() {
		var inputfile=$(this).val().split('\\');
		var extension = $(this).val().split('.');
		if(extension[1] != "png" && extension[1] != "PNG" &&
		   extension[1] != "jpg" && extension[1] != "jpeg"	){
			alert('이미지를 올려주세요.');
			$('#flie2').val("");
			$('#filevalue2').val("");
		}else{
			$("#filevalue2").text(inputfile[inputfile.length-1]);
			$('#file3_tr').css('display','table-row');
		}
	});
	
	$('#file3').change(function() {
		var inputfile=$(this).val().split('\\');
		var extension = $(this).val().split('.');
		if(extension[1] != "png" && extension[1] != "PNG" &&
		   extension[1] != "jpg" && extension[1] != "jpeg"	){
			alert('이미지를 올려주세요.');
			$('#flie3').val("");
			$('#filevalue3').val("");
		}else{
			$("#filevalue3").text(inputfile[inputfile.length-1]);
			$('#file4_tr').css('display','table-row');
		}
	});
	
	$('#file4').change(function() {
		var inputfile=$(this).val().split('\\');
		var extension = $(this).val().split('.');
		if(extension[1] != "png" && extension[1] != "PNG" &&
		   extension[1] != "jpg" && extension[1] != "jpeg"	){
			alert('이미지를 올려주세요.');
			$('#flie4').val("");
			$('#filevalue4').val("");
		}else{
			$("#filevalue4").text(inputfile[inputfile.length-1]);
			$('#file4').val(file4);
		}
	});
	
	/* 유효성 검사 */
	$('form').submit(function(){
		
		if ($('#area').val() == '') {
			$('#area').focus();
			alert('면적을 입력하세요.');
			return false;
		}
		
	    if (!$.isNumeric($('#area').val())) {
            alert("면적은 숫자로 입력하세요.");
            $('#area').val("");
            $('#area').focus();
            return false;
          }
		
		if ($('#price').val() == '') {
			$('#price').focus();
			alert('임대료를 입력하세요.');
			return false;
		}
		
		if (!$.isNumeric($('#price').val())) {
            alert("임대료는 숫자로 입력하세요.");
            $('#price').val("");
            $('#price').focus();
            return false;
     	}
	
		if ($('#filevalue1').text() == '') {
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
		
		var address = $('#autocomplete').val();
		var addArry = address.split(" ");
		if(addArry.length < 4 ){
			$('#autocomplete').focus();
			alert('주소를 상세하게 입력하세요.');
			return false;
		}
		
		if ($('#markerLat').val() == '') {
			$('#markerLat').focus();
			alert('농장위치를 지도에 마킹해주세요.');
			return false;
		}
		
		var result = confirm("게시글을 등록하시겠습니까?");
		if(result == true){
			return true;
		}else{
			return false;
			}
		
	});//submit()
	
});//ready()

function can_click(){
	var result = confirm("게시글 작성을 취소하시겠습니까?");
	if(result == true){
		location.href='../rental';
	}else{
		return false;
	}
}

var marker;
var pins = [];

/* 맵 초기화 함수 */	
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

/* 마킹하는 함수 */
function addMarker(location){
	var marker = new google.maps.Marker({
        position: location,
        map: map
      });
	pins.push(marker);
	
	$('#markerLat').val(location.lat());
	$('#markerLng').val(location.lng());
	
	
}//addMarker()

/* 마킹 제거하는 함수 */
function removeMarker(){
	for(var i=0; i<pins.length; i++){
		pins[i].setMap(null);
	}
	pins = [];
}//removeMarker()

