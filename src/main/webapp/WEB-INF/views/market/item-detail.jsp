<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/donong/resources/market/css/a.css">
	<link rel="stylesheet" type="text/css" href="/donong/resources/bootstrap-3.3.2-dist/css/bootstrap.css">
	<title>Home</title>
	<style>
		html, body {
			margin: 0px;
			padding: 0px;
		}
		.left-navbar {
			width: 150px;
		}
	</style>
</head>
<body>
<div class="container">
	<div>
		<h1>타이틀임</h1>
	</div>
	<div>
		<img src="#" width="100" height="100"/>
		<div>이름 : 모종삽</div>
		<div>가격 : 1000원</div>
		수량 : <input type="number" class="form-control"/>
		
	</div>
	<div>제품의 상세 정보들이 들어갈 공간</div>
	<div>
		<input class="btn btn-default" type="button" value="결제하기" onclick="location.href='/donong/market/payment'"/>
		<input class="btn btn-default" type="button" value="장바구니에 담기" onclick="location.href='/donong/market/cart/${itemNo}'" />
		<!--TODO ajax처리 예정 -->
	</div>
</div>
</body>
</html>
