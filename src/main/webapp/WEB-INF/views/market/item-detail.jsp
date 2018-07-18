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
	<form action="/donong/market/payment" method="post">
	<div>
		<h1>타이틀임</h1>
	</div>
	<div>
		<img src="${item.filePath }" width="100" height="100"/>
		<div>이름 : ${item.name }</div>
		<div>가격 : ${item.price }원</div>
		수량 : <input type="number" class="form-control" name="count"/>
		
	</div>
	<div>${item.content }</div>
	<div>
		<input class="btn btn-default" type="submit" value="결제하기"/>
		<button class="btn btn-default" type="button" onclick="location.href='/donong/market/cart/${itemNo}'">장바구니에 담기</button>
		<!--TODO ajax처리 예정 -->
	</div>
	</form>
</div>
</body>
</html>
