<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/donong/resources/bootstrap-3.3.2-dist/css/bootstrap.css">
	<title>Home</title>
	<style>
		.left-navbar {
			width: 150px;
		}
	</style>
</head>
<body>
<div>
	<div class="container">
		<h1>주문이 완료되었습니다.</h1>
		<input class="btn btn-default" type="button" value="마켓 메인으로" onclick="location.href='/donong/market'"/>
	</div>
</div>
</body>
</html>
