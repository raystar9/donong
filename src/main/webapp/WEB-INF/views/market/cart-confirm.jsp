<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="/resources/common/jsp/import.jsp" %>
	<title>Home</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	해당 물건을 장바구니에 담았습니다.
	<input type="button" class="btn btn-default" value="돌아가기" onclick="history.back()" />
	<input type="button" class="btn btn-default" value="장바구니로" onclick="location.href='/donong/market/cart'" />
</div>
</body>
</html>