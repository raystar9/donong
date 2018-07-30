$(document).ready(function() {
	viewMarkers();
	
	var sido = [
		'강원도', '경기도', '경상남도', '광주광역시', '대구광역시', '대전광역시', '부산광역시',
		'서울특별시', '울산광역시', '인천광역시','전라북도', '충청북도'
	];
	
	var Gangwondo1 = [
		'춘천시', '원주시', '강릉시', '동해시', '태백시', '속초시', '삼척시',
		'홍천군', '횡성군', '영월군'
	];
	var Gyeonggi2 = [
		'수원시', '성남시', '의정부시', '안양시', '부천시', '광명시', '평택시', '동두천시',
		'안산시', '고양시', '과천시', '남양주시', '오산시', '시흥시', '군포시', '의왕시',
		'하남시', '용인시', '파주', '이천시'
	];
	var Gyeongsangnam3 = [
		'창원시', '진주시', '통영시', '사천시', '김해시', '밀양시', '거제시', '양산시', '의령군',
		'함안군', '창녕군', '고성군'
	];
	var Gwangju4 = [
		'동구', '서구', '남구', '북구', '광산구'
	];
	var Daegu5 = [
		'중구', '동구', '서구', '남구', '북구', '수성구', '달서구', '달성군'
	];
	var Daejeon6 = [
		'중구', '동구', '서구', '유성구', '대덕구'
	];
	var Busan7 = [
		'중구', '동구', '서구', '남구', '북구', '영도구', '부산진구', '동래구', 
		'해운대구', '사하구', '금정구'
	];
	var Soul8 = [
		'종로구', '중구', '용산구', '성동구', '광진구', '동대문구', '중랑구', 
		'성북구', '강북구', '도봉구', '노원구', '은평구', '서대문구', '마포구', 
		'양천구', '강서구', '구로구', '금천구', '영등포구', '동작구', '관악구', 
		'서초구'
	];
	var Ulsan9 = [
		'중구', '동구', '남구', '북구', '울주군'
	];
	var Incheon10 = [
		'중구', '동구', '미추홀구', '연수구', '남동구', '부평구', '계양구', 
		'서구', '강화군', '옹진군'
	];
	var Jeollabuk11 = [
		'전주시', '군산시', '익산시', '정읍시', '남원시', '김제시', '완주군', 
		'진안군', '무주군', '장수군', '임실군', '순창군'
	];
 	var Chungcheong12 = [
 		'청주시', '충주시', '제천시', '보은군', '옥천군', '영동군', '증평군', 
 		'진천군', '괴산군', '음성군', '단양군'
 	];

 	$("#sido").append("<option value='0'>시,도</option>");
 	$.each(sido, function(key, value){
 		var num = key+1*1;
 		$("#sido").append("<option value='" + num + "'>" + value + "</option>");
 	})// each()
 	
 	
 	$("#sido").change(function(){
 		var sido = $("#sido").val();
 		if(sido == 0){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 		}else if(sido == 1){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 			$.each(Gangwondo1, function(key, value){
 				var num = key+1*1
 		 		$("#sigungu").append("<option value='" + num + "'>" + value + "</option>");
 		 	})
 		}else if(sido == 2){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 			$.each(Gyeonggi2, function(key, value){
 				var num = key+11*1
 		 		$("#sigungu").append("<option value='" + num + "'>" + value + "</option>");
 		 	})
 		}else if(sido == 3){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 			$.each(Gyeongsangnam3, function(key, value){
 				var num = key+31*1
 		 		$("#sigungu").append("<option value='" + num + "'>" + value + "</option>");
 		 	})
 		}else if(sido == 4){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 			$.each(Gwangju4, function(key, value){
 				var num = key+43*1
 		 		$("#sigungu").append("<option value='" + num + "'>" + value + "</option>");
 		 	})
 		}else if(sido == 5){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 			$.each(Daegu5, function(key, value){
 				var num = key+48*1
 		 		$("#sigungu").append("<option value='" + num + "'>" + value + "</option>");
 		 	})
 		}else if(sido == 6){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 			$.each(Daejeon6, function(key, value){
 				var num = key+56*1
 		 		$("#sigungu").append("<option value='" + num + "'>" + value + "</option>");
 		 	})
 		}else if(sido == 7){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 			$.each(Busan7, function(key, value){
 				var num = key+61*1
 		 		$("#sigungu").append("<option value='" + num + "'>" + value + "</option>");
 		 	})
 		}else if(sido == 8){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 			$.each(Soul8, function(key, value){
 				var num = key+72*1
 		 		$("#sigungu").append("<option value='" + num + "'>" + value + "</option>");
 		 	})
 		}else if(sido == 9){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 			$.each(Ulsan9, function(key, value){
 				var num = key+94*1
 		 		$("#sigungu").append("<option value='" + num + "'>" + value + "</option>");
 		 	})
 		}else if(sido == 10){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 			$.each(Incheon10, function(key, value){
 				var num = key+99*1
 		 		$("#sigungu").append("<option value='" + num + "'>" + value + "</option>");
 		 	})
 		}else if(sido == 11){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 			$.each(Jeollabuk11, function(key, value){
 				var num = key+109*1
 		 		$("#sigungu").append("<option value='" + num + "'>" + value + "</option>");
 		 	})
 		}else if(sido == 12){
 			$("#sigungu").empty();
 			$("#sigungu").append("<option value='0'>시,군,구 </option>");
 			$.each(Chungcheong12, function(key, value){
 				var num = key+121*1
 		 		$("#sigungu").append("<option value='" + num + "'>" + value + "</option>");
 		 	})
 		}
 		
 	})// change()
 	
 	$('form').submit(function(){
		
 		if (!$.isNumeric($('#num').val()) && !$('#num').val("")) {
            alert("농지번호는 숫자로 입력하세요.");
            $('#num').val("");
            $('#num').focus();
            return false;
          }
		
	    if (!$.isNumeric($('#price').val()) && !$('#price').val("")) {
            alert("임대료는 숫자로 입력하세요.");
            $('#price').val("");
            $('#price').focus();
            return false;
          }
		
	});// submit()
 		
	
});// ready()

/* 농지대여 글 검색 */
function search(){
	var num = $("#num").val();
	var sido = $("#sido").val();
	var sigungu = $("#sigungu").val();
	var price = $("#price").val();
	
	if(num == "")
		num = 0;
	
	if(price == "")
		price = 0;
	
	 $.ajax({
	 type : "GET",
	 data : { "num":num , "sido":sido, "sigungu":sigungu, "price":price}, 
	 url : '/donong/search',
	 success : function(json){
		 $(".viewbox").remove();
		 var content = "";
		 if(json.length == 0){
			 content = "<img src='./resources/rental/upload/searchNo2.png' class='searchNo'>";
		 }else{
			 for(var i=0; i<json.length; i++){
				content = "<div class='viewbox'>" +
						"<div id='top'>"+
						"No.&nbsp;"+ json[i].num +
						"</div>"+
		 			   	"<div class='row'>"+
		 			   	"<a href='./rental/view?num="+ json[i].num +"'><img src='/donong/rental/displayFile?fileName="+json[i].path +"&directory=rent' class='img'></a>"+
		 			   	"</div>"+
		 			   	"<div class='row'>"+
		 			   	"<img src='./resources/rental/image/flag.png' class='mark'/>&nbsp;"+json[i].title+"<br>"+
		 			   	"</div>"+
		 			   	"<div class='row'>"+
		 			   	"<img src='./resources/rental/image/area3.png' class='mark'/>&nbsp;"+json[i].area+"㎡<br>"+
		 			   	"</div>"+
		 			   	"<div class='row'>"+
		 			   	"	<img src='./resources/rental/image/dollar.png' class='mark'/>&nbsp;"+ json[i].price+ "원<br>"+
		 			   	"</div>"+
		 			   	"</div>";
			 }
		 }
		 $("#List").append(content);
	 },
	 error:function(){
		 alert('Ajax 실패!');
	 }
	});// ajax()
};// search()

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
		url: '/donong/markerJson',
		success: function(json){
			for(var i=0; i<json.length; i++){
				
				var infoContent = "<div style='font-size:10px; font-weight:bold;'>" +
								  "<h3>< "+json[i].title+" ></h3><br>"+
				  				  "<a href='./rental/view?num="+json[i].num+"'><img src='./resources/rental/upload"+json[i].path+"' width='120px' height='80px''></a><br><br>"+
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

