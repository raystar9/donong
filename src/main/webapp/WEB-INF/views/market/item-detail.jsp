<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="/resources/common/jsp/import.jsp" %>
	<script src="/donong/resources/market/js/item-detail.js"></script>
	 <title>나만따라와 도시농부</title>
	<script>
		function onSubmitItem(){
			if($("#quantity").val() <= 0){
				alert("수량은 1개 이상을 입력해야합니다.");
				return false;
			} else {			
				return true;
			}
		}
	</script>
	<style>
		.item-count {
			width: 100px;
		}
		.item-info{
			height: 550px;
		}
		.item-info-image, .item-info-content{
			margin-top: 50px;
		}
		.container-flex {
			display: flex;
			border-radius: 10px;
			border: 1px solid #ddd;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<form id="item-detail-form" class="form-horizontal" action="/donong/market/order/item/${itemNo}" method="get" onsubmit="return onSubmitItem()">
	<div>
		<h1>타이틀임</h1>
	</div>
	<div class="container container-flex item-info">
	<div class="col-sm-5 item-info-image align-middle">
		<img class="img-responsive img-thumbnail" src="${item.filePath }"/>
	</div>
	<div class="col-sm-7 item-info-content align-middle">
		<div class="form-group text-center"><h2>${item.name }</h2></div>
		<div class="form-group text-right"><h3>${item.price }원</h3></div>
		<div class="form-group text-right"><h3>배송비 : 무료</h3></div>
		<div class="form-group row"><label class="control-label col-sm-3" for="number">수량 : </label><div class="col-sm-9"><input type="number" class="form-control" id="quantity" name="quantity" value="1"/></div></div>
		<div class="form-group row">
			<input class="btn btn-default col-sm-6 input-lg" type="submit" value="주문하기"/>
			<button class="btn btn-default col-sm-6 input-lg" type="button" onclick="cartItem(${item.num}, ${sessionBean.memberNum})">장바구니에 담기</button>
			<!--TODO ajax처리 예정 -->
		</div>
	</div>
	</div>
	<div class="container"><h4>${item.content }</h4></div>
	</form>
</div>
</body>
</html>
