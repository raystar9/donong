<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<tbody>
	<tr>
		<th width=20px>#</th>
		<th>입금자</th>
		<th>상품명</th>
		<th>상품 가격</th>
		<th>주문일</th>
		<th>주문정보</th>
	</tr>
	
	<c:forEach items="${orderList}" var="orderItem" varStatus="status">
	<tr>
		<td><input type="checkbox" name="pay-check" value="${orderItem.orderNum }"/></td>
		<td>${orderItem.ordererName}</td>
		<td>${orderItem.orderName}</td>
		<td><fmt:formatNumber pattern="#,###">${orderItem.price }</fmt:formatNumber>원</td>
		<td>${orderItem.orderDate }</td>
		<td><input class="btn btn-default detail-popover" data-toggle="popover" data-html="true" type="button" value="확인" 
		data-content="
			<table>
				<tr>
					<th>상품명</th>
					<th>가격</th>
					<th>수량</th></tr>
			<c:forEach items="${orderItem.goods }" var="eachGoods" >
				<tr>
				<td>${eachGoods.name}</td>
				<td><fmt:formatNumber pattern="#,###">${eachGoods.price }</fmt:formatNumber>원</td>
				<td>${eachGoods.quantity}</td>
				</tr>
			</c:forEach>
			<table>
			"
		 /></td>
	</tr>
	</c:forEach>
</tbody>