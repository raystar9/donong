<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
	<script src="/donong/resources/service/js/qna_edit.js"></script>
	
	<link rel="stylesheet" href="/donong/resources/service/css/qna_edit.css" type="text/css">	
	
</head>
<body>
	문의하기 수정

	<f:form method="put" action="/donong/cs/qna/${qna.num }">
		분류 : 
			<select name="category" id="category">
				<option value="0" selected="selected">선택</option>
				<option value="1">고객정보</option>
				<option value="2">주문/결제</option>
				<option value="3">배송</option>
				<option value="4">상품/상품평</option>
				<option value="5">취소</option>
				<option value="6">반품</option>
				<option value="7">교환</option>
				<option value="8">이벤트/제휴/기타</option>
				<option value="9">고객의소리</option>
			</select> <br />
			<script>
				$('#category').val('${qna.category}').attr('selected', 'selected');
			</script>
			제목 : <input id="title" name="title" value="${qna.title }" /> <br />
			내용 : <textarea id="content" name="content">${qna.content }</textarea>
			
			<input type="submit" value="등록">
			<input type="reset" value="취소">
	</f:form>

</body>
</html>