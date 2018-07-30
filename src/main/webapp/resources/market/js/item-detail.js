function cartItem(itemNum, memberNum) {
	$.ajax({
		url: '/donong/market/cart/' + itemNum,
		method: 'post',
		data: {
			num: 6,
			goodsNum: itemNum,
			memberNum: memberNum,
			quantity: $("#quantity").val()
		},
		success: function(result){
			location.href='/donong/market/cart/confirm';
		},
		error: function(res){
			alert('오류가 발생했습니다.');
		}
	});
}