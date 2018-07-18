<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/resources/market/css/a.css">
	<link rel="stylesheet" type="text/css" href="/donong/resources/bootstrap-3.3.2-dist/css/bootstrap.css">
	<title>Home</title>
</head>
<body>
<div class="container">
	해당 물건을 장바구니에 담았습니다.
	<input type="button" value="돌아가기" onclick="history.back()" />
	<input type="button" value="장바구니로" onclick="location.href='/donong/market/cart'" />
</div>
</body>
</html>