<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<tbody>
	<tr>
		<th>수취인</th>
		<th>상품명</th>
		<th>운송장 번호</th>
		<th>배송 상태 확인</th>
	</tr>
	<c:forEach items="${orderList}" var="orderItem">
	<tr>
		<td>${orderItem.receiverName}</td>
		<td>${orderItem.orderName}</td>
		<td>${orderItem.waybill}</td>
		<td><input class="btn btn-default" type="button" value="확인" /></td>
	</tr>
	</c:forEach>
</tbody>