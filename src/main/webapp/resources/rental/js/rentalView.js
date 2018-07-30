$(document).ready(function() {
	
	/* image hover */
	$("#Img1").hover(function(){
		var img1 = $("#Img1").attr('src');
		$("#big").attr('src', img1);
	});
	
	$("#Img2").hover(function(){
		var img2 = $("#Img2").attr('src');
		var imgArr2 = img2.split('/');
		if(imgArr2.length == 8)
		$("#big").attr('src', img2);
	});
	
	$("#Img3").hover(function(){
		var img3 = $("#Img3").attr('src');
		var imgArr3 = img3.split('/');
		if(imgArr3.length == 8)
		$("#big").attr('src', img3);
	});
	
	$("#Img4").hover(function(){
		var img4 = $("#Img4").attr('src');
		var imgArr4 = img4.split('/');
		if(imgArr4.length == 8)
		$("#big").attr('src', img4);
	});

});//ready()


/* 게시글 삭제버튼 onClick 이벤트 */
function del_click(){
	var num = $("#board_num").val();
	var result = confirm("게시글을 삭제하시겠습니까?");
	if(result == true){
		location.href='./delete?num=' + num+ '&directory=rent';
	}else{
		return false;
	}
}


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
