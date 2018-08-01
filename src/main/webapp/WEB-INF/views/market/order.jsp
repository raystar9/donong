<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="/resources/common/jsp/import.jsp" %>
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
		.input-phone{
			width: 80px;
		}
	</style>
	<script>
		$().ready(()=>{
			var $form = $(".order-form");
			$form.submit(e=>{
				if($("#name").val() == ''){
					alert("이름을 입력해주세요.");
					return false;
				}
				if($("#phone").val() == ''){
					alert("연락처를 입력해주세요.");
					return false;
				}
				if($("#address").val() == ''){
					alert("주소를 입력해주세요.");
					return false;
				}
				if($("#addressdetail").val() == ''){
					alert("상세 주소를 입력해주세요.");
					return false;
				}
			});
		})
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">

	<h1>결제 페이지</h1>
	<div>
	<p>${repItemTitle }</p>
	<c:if test="${itemCount == 1 }">
	
		<p>단가 : ${item.price }원</p>
		<p>주문 개수 : ${item.quantity }개</p>
		
	</c:if>
	<c:if test="${itemCount > 1 }">
	 	외 ${itemCount -1 }개 제품
	 </c:if>
	<p>총 가격 : ${totalPrice }원</p>
	</div>
	
	<form class="order-form" action="/donong/market/order/process" method="post">
	<fieldset>
	<legend>배송정보</legend>
			<label for="name">주문인</label><input class="form-control" type="text" name="name" id="name" value="${member.realname }"/>
			<label for="phone">연락처</label>
			<div class="form-group row">
				<div class="col-sm-2">
				<input class="form-control" type="text" name="phone" id="phone" value="${member.phone }" />
				</div>
			</div>
			<label for="address">주소</label><input class="form-control" type="text" name="address" id="address" value="${member.address }" />
			<input class="form-control" type="text" name="addressdetail" id="addressdetail" value="${member.addressdetail }" />
			<label for="comments">코멘트</label><input class="form-control" type="text" name="comments" id="comments" />
		<input class="btn btn-default" type="submit" value="주문하기" />
		<c:if test="${!isCart }">
			<input type="hidden" name="goodsNum" value="${item.num}"/>
			<input type="hidden" name="goodsQuantity" value="${item.quantity}"/>
		</c:if>
	</fieldset>
	</form>
</div>
</body>
</html>
