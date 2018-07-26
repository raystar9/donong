<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<c:forEach items="${orderList}" var="orderItem">
	<tr>
		<td><input type="checkbox" name="pay-check" id="pay-check1" /></td>
		<td>${orderItem.ordererName}</td>
		<td>${orderItem.orderName}</td>
		<td>${orderItem.price }</td>
		<td>${orderItem.orderDate }</td>		
		<td><input class="btn btn-default" type="button" value="확인" /></td>
	</tr>
	</c:forEach>
</tbody>