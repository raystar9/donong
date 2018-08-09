<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="/resources/common/jsp/import.jsp" %>
	 <title>나만따라와 도시농부</title>
	<style>
		.left-navbar {
			width: 150px;
		}
		input[type=number]::-webkit-inner-spin-button, 
		input[type=number]::-webkit-outer-spin-button { 
		  -webkit-appearance: none; 
		  margin: 0; 
		}
		.input-phone{
			width: 80px;
		}
		.item-info {
			height: auto;
		}
		.item-title {
			font-size: 22pt;
			font-weight: bold;
		}
		.item-count {
			font-size: 18pt;
		}
		.item-price {
			font-size: 20pt;
			vertical-align: bottom;
		}
	</style>
	<script>
		$().ready(()=>{
			var $form = $(".order-form");
			$form.submit(e=>{
				if($("#name").val() == ''){
					alert("이름을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				if($("#phone").val() == ''){
					alert("연락처를 입력해주세요.");
					$("#phone").focus();
					return false;
				}
				if($("#address").val() == ''){
					alert("주소를 입력해주세요.");
					$("#address").focus();
					return false;
				}
				if($("#addressdetail").val() == ''){
					alert("상세 주소를 입력해주세요.");
					$("#addressdetail").focus();
					return false;
				}
				if($("#comments").val() == ''){
					alert("코멘트를 입력해주세요.");
					$("#comments").focus();
					return false;
				}
			});
		})
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">

	<h1>Donong 자재구매</h1>
	<form class="order-form" action="/donong/market/order/process" method="post">
	<div class="container-fluid">
	<div class="col-sm-6 form-group">
	<fieldset>
	<legend>배송정보</legend>
		<div class="form-group">
			<label for="name">주문인</label><input class="form-control" type="text" name="name" id="name" value="${member.realname }"/>
		</div>
		<div class="form-group">
			<label for="phone">연락처</label>
			<input class="form-control" type="text" name="phone" id="phone" value="${member.phone }" />
		</div>
		<div class="form-group">
			<label for="address">주소</label><input class="form-control" type="text" name="address" id="address" value="${member.address }" />
			<input class="form-control" type="text" name="addressdetail" id="addressdetail" value="${member.addressdetail }" />
		</div>
		<div class="form-group">
			<label for="comments">코멘트</label><input class="form-control" type="text" name="comments" id="comments" />
		</div>
		
		
		<c:if test="${!isCart }">
			<input type="hidden" name="goodsNum" value="${item.num}"/>
			<input type="hidden" name="goodsQuantity" value="${item.quantity}"/>
		</c:if>
	</fieldset>
	
	</div>
	<div class="col-sm-6 item-info">
	<fieldset>
	<legend>구매 상품 정보</legend>
	<div>
	<span class="item-title">${repItemTitle }</span>
	<c:if test="${itemCount == 1 }">
	
		<p>단가 : <fmt:formatNumber pattern="#,###">${item.price }</fmt:formatNumber>원</p>
		<p>주문 개수 : <fmt:formatNumber pattern="#,###">${item.quantity }</fmt:formatNumber>개</p>
		
	</c:if>
	<c:if test="${itemCount > 1 }">
	 	<span class="item-count">외 ${itemCount -1 }개 제품</span>
	 </c:if>
	<p class="item-price text-right">총 가격 : <fmt:formatNumber pattern="#,###">${totalPrice }</fmt:formatNumber>원</p>
	</div>
	</fieldset>
	</div>
	</div>
	<div class="container-fluid">
		<input class="btn btn-default" type="submit" value="주문하기" />
	</div>
	</form>
</div>
</body>
</html>
