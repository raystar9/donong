<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>나만따라와 도시농부</title>
</head>
<body>
	<form action="/donong/cs/s3_upload" enctype="multipart/form-data" method="post">
		<input type="file" name="file" />
		<input type="submit" value="전송" />
	</form>
</body>
</html>