<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<tbody>
	<tr>
		<th width=20px>#</th>
		<th>수취인</th>
		<th>상품명</th>
		<th>주소</th>
		<th>코멘트</th>
		<th>송장번호입력</th>
	</tr>
	<c:forEach items="${orderList}" var="orderItem">
	<tr>
		<td><input type="checkbox" name="pay-check" value="${orderItem.orderNum }"/></td>
		<td>${orderItem.receiverName}</td>
		<td>${orderItem.orderName}</td>
		<td>${orderItem.address}</td>
		<td>${orderItem.comments}</td>
		<td><input class="form-control" type="text" name="waybill-${orderItem.orderNum }" id="waybill-${orderItem.orderNum }"/></td>
	</tr>
	</c:forEach>
</tbody>