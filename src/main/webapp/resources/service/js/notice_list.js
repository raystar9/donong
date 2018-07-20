$(document).ready(function () {
	
	$('#srcBtn').click(function () {
		
		if ($.trim($('#srcTxt').val()) == '') {
			alert('검색어를 입력하세요.');
			$('#srcTxt').val('').focus();
			
			return false;
		}
		
		$.ajax({
			type: "get",
			data: {
				'srcOpt': $('#srcOpt option:selected').val(),
				'srcTxt': $('#srcTxt').val(),
				"state": "search"
			},
			url: "/donong/cs/notice",
			cache: false,
			headers: {
				"cache-control": "no-cache",
				"pragma": "no-cache"
			},
			success: function (data) {
				$("table:first").empty().prepend(data);
			},
			error : function(request, status, error){
			    alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			    console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
		   }
		});	
	});
	
	$(document).on('click', '#pagingTd a', function () {
		var page;
		                          
		if ($(this).html() == '이전') {
			page = $('#currPage').html() * 1 - 1;
		} else if ($(this).html() == '다음') {
			page = $('#currPage').html() * 1 + 1;
		} else {
			page = $(this).html();
		}
		
		$.ajax({
			type: "get",
			data: {
				'page': page,
				'srcOpt': $('#srcOpt option:selected').val(),
				'srcTxt': $('#srcTxt').val(),
				"state": "paging"
			},
			url: "/donong/cs/notice",
			cache: false,
			headers: {
				"cache-control": "no-cache",
				"pragma": "no-cache"
			},
			success: function (data) {
				$("table:first").empty().prepend(data);
			},
			error : function(request, status, error){
			    alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			    console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
		   }
		});
	});
});