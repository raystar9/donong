<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<table style="width:700px">
<c:forEach var="row" items="${list }">
<tr>
<td>
${row.userName }(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/> )
<br>
${row.replytext }
</td>
</tr>
</c:forEach>
</table>