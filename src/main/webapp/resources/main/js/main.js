$(document).ready(function() {
	viewMarkers();
});

/* 맵 필드 변수 설정 */
var marker;
var pins = [];
var infoContentArr = [];
var infoWindowArr = [];

/* 맵 초기화 함수 */	
function initMap(){
	var seoul = {			// 서울 시청으로 처음 위치 지정
		lat : 36.58327953071077,
		lng : 127.89600693824082	
	};
	
	map = new google.maps.Map(document.getElementById("map"), {
		zoom : 7,
		center : seoul,
		scrollwheel: true
	});
	
}// initMap()

/* Ajax로 DB에서 json받아 marker 생성 */
function viewMarkers(){
	$.ajax({
		type: "POST",
		url: '/donong/markJson',
		success: function(json){
			for(var i=0; i<json.length; i++){
				
				var infoContent = "<div style='font-size:10px; font-weight:bold;'>" +
								  "<h3>< "+json[i].title+" ></h3><br>"+
				  				  "<a href='./rental/view?num="+json[i].num+"'><img src='/donong/rental/displayFile?fileName="+json[i].path+"&directory=rent' width='120px' height='80px'></a><br><br>"+
				  				  "* 번호 &nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;"+json[i].num+"<br>"+
				  				  "* 소재지 : "+json[i].title+"<br>"+
				  				  "* 면적&nbsp;&nbsp;&nbsp;&nbsp; : "+json[i].area+"㎡<br>"+
				  				  "* 임대료 : "+json[i].price+"원"+
				  				  "</div>";
				// 각 게시글마다의 내용들을 배열에 담는다.
				infoContentArr.push(infoContent);
				
				// 생성 된 인포 윈도우 배열과 json으로 마커를 생성해 주는 함수에 전달
				addMarker(json[i],i)
			}
		},
		error:function(){
			alert('Ajax 에러발생!');
		}
		
	});// ajax
	
}// viewMarkers()

/* 마킹하는 함수 (json의 좌표값, 순서) */
function addMarker(location, i){
	
	pins.push(new google.maps.Marker({
		position : new google.maps.LatLng(location.lat, location.lng),
		map : map,
	})); // push()
	
	pins[i].addListener('click', function(){
		var infoWindow = new google.maps.InfoWindow({
			content : infoContentArr[i],
			maxWidth: 350
		});
		
		// 인포윈도우 배열에 담는다.
		infoWindowArr.push(infoWindow);
		// 마커를 클릭 했을 때 인포 윈도우를 오픈 해 준다.
		infoWindow.open(pins[i].get('map'), pins[i]);
		// 인포 윈도우 바깥의 지도 영역을 클릭 하면 인포윈도우를 닫아준다.
		google.maps.event.addListener(map, 'click', function(){
			infoWindow.close();
		});
		
	});// addListener
	
}// addMarker()