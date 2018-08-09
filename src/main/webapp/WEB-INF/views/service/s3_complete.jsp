<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>나만따라와 도시농부</title>
</head>
<body>
	업로드 된 이미지 : <br />
	<img src="/donong/cs/displayFile?fileName=${imgPath }&directory=rent" alt="이상이상" />
	<form action="/donong/cs/deleteFile" method="post">
		<input type="hidden" name="fileName" value="${imgPath }" />
		<input type="hidden" name="directory" value="rent" />
		<input type="submit" value="삭제" />
	</form>
	
	<form action="/donong/cs/download" method="get">
		<input type="hidden" name="directory" value="rent" />
		<input type="hidden" name="fileName" value="${imgPath }" />
		<input type="submit" value="다운로드" />
	</form>
	
	
</body>
</html>