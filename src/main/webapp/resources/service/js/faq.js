$(document).ready(function () {

	$(document).on('click', '.accordian', function () {
		$(this).toggleClass('active');
		var panel = $(this).next();
		
		if (panel.css('display') == 'none') {
			panel.css('display', 'block');
			
			$.ajax({
				url: '/donong/cs/faq/' + $(this).val(),
				dataType: 'json',
				success: function (result) {
					if (result == 1) {
						panel.children('.readCount').html(panel.children('.readCount').html() * 1 + 1);
					}
				},
				error : function(request, status, error){
				    alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
				    console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			   }
			});
			
		} else {
			panel.css('display', 'none');
		}

	});
	
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
				'keyword': $('#keyword').val(),
				"state": "paging"
			},
			url: "/donong/cs/faq",
			cache: false,
			headers: {
				"cache-control": "no-cache",
				"pragma": "no-cache"
			},
			success: function (data) {
				$("#faqList").empty().prepend(data);
			},
			error : function(request, status, error){
			    alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			    console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
		   }
		});
	});
	
});