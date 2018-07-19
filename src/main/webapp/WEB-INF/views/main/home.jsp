<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>


	<title>메인페이지</title>
	
</head>
<body>
	 <c:if test = '${sessionBean.nickname == null }'>
		<a href="member_login">로그인</a>
		<a href="member_join">회원가입</a>
	</c:if>
	<c:if test = '${sessionBean.nickname != null }'>
		${sessionBean.nickname}님 마실나오셨네요
		<button id="mypage" onclick="location.href='member_mypage'">MyPage</button>
		<button id="logout" onclick="location.href='member_logout'">로그아웃</button>
	</c:if> 

		

	
	
</body>
</html>


	