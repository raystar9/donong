$(document).ready(function () {

	$(document).on('click', '#pagingTd a', function () {
		var page;
		                          
		if ($(this).html() == '«') {
			page = $('#currPage').html() * 1 - 1;
		} else if ($(this).html() == '»') {
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
			url: "/donong/cs/qna",
			cache: false,
			headers: {
				"cache-control": "no-cache",
				"pragma": "no-cache"
			},
			success: function (data) {
				$("table#boardList").empty().prepend(data);
			},
			error : function(request, status, error){
			    alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			    console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
		   }
		});
	});
});