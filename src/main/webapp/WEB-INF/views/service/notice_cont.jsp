<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	공지사항 보기
	${notice.num } <br />
	${notice.title } <br />
	${notice.content } <br />
	${notice.regitdate } <br />
	
	<button onclick="location.href='/donong/cs/notice/${notice.num}?state=edit'">수정</button>
	<f:form method="delete" action="/donong/cs/notice/${notice.num }">
		<input type="submit" value="삭제" />
	</f:form>
	<button onclick="location.href='/donong/cs/notice'">목록으로</button>

</body>
</html>