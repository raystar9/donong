<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script>
//댓글 수정
$("#btnReplyUpdate").click(function(){
var detailReplytext=$("#detailReplytext").val();
$.ajax({
	type:"put",
	url:"/donong/reply/update/${vo.num}",
	headers:{
		"Content-Type":"application/json"
	},
	data:JSON.stringify({
		contents:detailReplytext
	}),
	dataType:"text",
	success:function(result){
		alert("댓글이 수정되었습니다.");
		if(result=="success"){
			$("#modifyReply").css("visibility","hidden");
			listReplyRest("1");
			
			}
		}
	});		
});

//댓글 상세화면 닫기
$("#btnReplyClose").click(function(){
	$("#modifyReply").css("visibility","hidden");
});
//댓글 삭제
$("#btnReplyDelete").click(function(){
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type:"delete",
			url:"/donong/reply/delete/${vo.num}",
			success:function(result){
				if(result=="success"){
					alert("삭제되었습니다.");
					$("#modifyReply").css("visibility","hidden");
					listReplyRest("1");
				}
			}
		});
	}
});
</script>
</head>
<body>
댓글 번호 : ${vo.num }<br>
<textarea id="detailReplytext" rows="5" cols="82">${vo.contents }</textarea>
<div style="text-align:center;">

<button type="button" id="btnReplyUpdate">수정</button>
<button type="button" id="btnReplyDelete">삭제</button>
<button type="button" id="btnReplyClose">닫기</button>
</div>
</body>
</html>