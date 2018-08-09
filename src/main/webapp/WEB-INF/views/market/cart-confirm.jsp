<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="/resources/common/jsp/import.jsp" %>
	 <title>나만따라와 도시농부</title>
	<style>
		.main{
			margin-top:130px;
		}
		.btn-container {		
		}
		.btn-group {
			display : block;
			margin: 0 auto;
			margin-top: 15px;
			width: 400px;
			height: 50px;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row main text-center">
	해당 물건을 장바구니에 담았습니다.
	</div>
	
	<div class="container btn-container">
	<div class="btn-group">
	<div class="col-sm-6">
	<input type="button" class="form-control btn btn-default btn-width" value="돌아가기" onclick="history.back()" />
	</div>
	<div class="col-sm-6">
	<input type="button" class="form-control btn btn-default btn-width" value="장바구니로" onclick="location.href='/donong/market/cart'" />
	</div>
	</div>
	</div>
</div>
</body>
</html>