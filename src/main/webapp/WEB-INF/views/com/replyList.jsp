<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<table style="width:700px">
<c:forEach var="row" items="${list }">
<tr>
<td>
${row.replyer }(${row.regDate})
<br>
${row.contents}


<c:if test="${sessionBean.nickname==row.replyer}">
<input type="button" id="btnModify" value="수정" onclick="showReplyModify('${row.num}')">
</c:if>
</td>
</tr>
</c:forEach>

</table>

<!-- 댓글 수정 영역 -->
<div id="modifyReply"></div>

