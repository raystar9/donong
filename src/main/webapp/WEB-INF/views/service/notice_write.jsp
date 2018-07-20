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
글쓰기 폼 

	<f:form method="post" action="/donong/cs/notice">
		제목 : <input id="title" name="title" /> <br />
		내용 : <textarea id="content" name="content"></textarea>
			
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</f:form>

</body>
</html>