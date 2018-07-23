$(document).ready(function () {
	
	$('.accordian').click(function () {
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
	
});