<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script>
		
	
	</script> 

	<title>메인페이지</title>
	
</head>
<body>
	<c:if test = '${empty sessionScope.id }'>
		<a href="member_login">로그인</a>
		<a href="member_join">회원가입</a>
	</c:if>
	<c:if test = '${!empty sessionScope.id }'>
		${memberDTO.nickname}님 마실나오셨네요
	</c:if>


	
	
</body>
</html>


	