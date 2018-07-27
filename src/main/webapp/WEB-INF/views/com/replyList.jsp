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


<input type="button" id="btnModify" value="수정" onclick="showReplyModify('${row.num}')">

</td>
</tr>
</c:forEach>

<!-- 페이징 -->
<tr style="text-align:center;">
<td>

<!-- 현재 페이지 블럭이 1보다 크면 처음페이지로 이동 -->
<c:if test="${replyPager.curBlock>1 }">
<a href="javascript:listReply('1')">[처음]</a>
</c:if>

<!-- 현재 페이지 블럭이 1보다 크면 이전 페이지로 이동 -->
<c:if test="${replyPager.curBlock>1 }">
<a href="javascript:listReply('${replyPager.prevPage }')">[이전]</a>
</c:if>

<!-- 페이지 블럭 처음부터 마지막 블럭까지 -->
<c:forEach var="num" begin="${replyPager.blockBegin }" end="${replyPager.blockEnd }">
<c:choose>
<c:when test="${num == replyPager.curPage }">
${num}&nbsp;
</c:when>
<c:otherwise>
<a href="javascript:listReply('${num }')">${num }</a>&nbsp;
</c:otherwise>
</c:choose>
</c:forEach>

<!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 다음페이지로 이동 -->
<c:if test="${replyPager.curBlock <= replyPager.totBlock }">
<a href="javascript:listReply('${replyPager.nextPage }')">[다음]</a>
</c:if>
<!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 끝으로 이동 -->
<c:if test="${replyPager.curBlock <= replyPager.totBlock }">
<a href="javascript:listReply('${replyPager.totPage }')">[끝]</a>
</c:if>
</td>
</tr>
</table>

<!-- 댓글 수정 영역 -->
<div id="modifyReply"></div>

