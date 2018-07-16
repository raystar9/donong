<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/resources/market/css/a.css">
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

	<h1>결제 페이지</h1>
	<div>
		<div>간단한 상품 정보</div>
		<div>결제 총 가격</div>
	</div>
	<form action="/donong/market/payment/process" method="post">
	<div>
		<div>
			배송정보
			<label for="name">주문인</label><input class="form-control" type="text" name="name" id="name" />
			<label for="address">주소</label><input class="form-control" type="text" name="address" id="address" />
			<label for="comment">코멘트</label><input class="form-control" type="text" name="comment" id="comment" />
		</div>
		<div><input class="btn btn-default" type="submit" value="주문하기" /></div>
	</div>
	</form>
</div>
</body>
</html>
