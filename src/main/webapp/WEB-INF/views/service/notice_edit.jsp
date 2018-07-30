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
	공지사항 수정

	<f:form method="put" action="/donong/cs/notice">
		제목 : <input type="text" id="title" name="title" value="${notice.title }" /> <br />
		내용 : <textarea name="content" id="content" cols="30" rows="10">${notice.content }</textarea>
			
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</f:form>

</body>
</html>