function getMember() {
	$.ajax({
		url : '/donong/donong/ajax',
		success : function(res){
			alert(res);
		}
	});	
};
function updateCartItem(index, cartNum) {
	$.ajax({
		data: $("#quantity"+index).val(),
		url: '/donong/market/cart/' + cartNum,
		method: 'put',
		success: function(totalPrice){
			$("#total-price").html(totalPrice + "원");
			alert("수정 완료");
		},
		error: function(){
			alert("수정 실패");					
		}
	});
};
function deleteCartItem(index, cartNum) {
	var isConfirm = confirm('정말로 삭제하시겠습니까?');
	if(isConfirm) {
		$.ajax({
			url: '/donong/market/cart/' + cartNum,
			method: 'delete',
			success: function(totalPrice){
				alert("삭제 완료");
				$("#thumbnail"+index).remove();
				$("#total-price").html(totalPrice + "원");
			},
			error: function(){
				alert("삭제 실패");					
			}
		});
	}
	else {
		return false;
	}
}