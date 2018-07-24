<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/donong/resources/bootstrap-3.3.2-dist/css/bootstrap.css">
	<script type="text/javascript" src="/donong/resources/jquery/jquery-3.3.1.min.js"></script>
	<script src="/donong/resources/market/js/cart.js"></script>
	<title>Home</title>
	<style>
		.left-navbar {
			width: 150px;
		}
		input[type=number]::-webkit-inner-spin-button, 
		input[type=number]::-webkit-outer-spin-button { 
		  -webkit-appearance: none; 
		  margin: 0; 
		}
	</style>
</head>
<body>
<div class="container">
	<div>
		<h1>장바구니 페이지</h1>
	</div>
	<div>
		<c:forEach items="${items}" var="item" varStatus="status">
			<%@ include file="/WEB-INF/views/market/cart-item.jsp" %>
		</c:forEach>
		<label for="price">총 가격 : </label>
		<p class="form-control-static" id="total-price">${totalPrice }원</p>
	</div>
		<input type="button" class="btn btn-default" value="주문하기" onclick="location.href='/donong/market/order/cart'"/>
		<!-- <input type="button" value="돌아가기" onclick="history.back();"/> -->
</div>
</body>
</html>
