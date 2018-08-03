<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<tr>
	<th width="10%">번호</th>
	<th width="80%">제목</th>
	<th width="10%">등록일</th>
</tr>

<c:set var="num" value="${listCount - (page - 1) * 10 }"/>
<c:forEach var="content" items="${noticeList }">
	<tr class="notice_tr">
		<td>
			<c:out value="${num }" />
			<c:set var="num" value="${num - 1 }" />
		</td>
		<td>
			<div>
				<a href="./notice/${content.num }?state=cont">
					${content.title } 
				</a>
			</div>
		</td>
		<td>${content.regitdate }</td>
	</tr>
</c:forEach>
<tr>
	<td colspan="3" id="pagingTd">
		<c:if test="${page <= 1 }">
			&laquo;&nbsp;
		</c:if>
		<c:if test="${page > 1 }">
			<a>&laquo;</a>
		</c:if>
		
		<c:forEach var="pageNum" begin="${startPage }" end="${endPage }">
			<c:if test="${pageNum == page }">
				<span id="currPage">${pageNum }</span>
			</c:if>
			<c:if test="${pageNum != page }">
				<a>${pageNum }</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${page >= maxPage }">
			&nbsp;&raquo;
		</c:if>
		<c:if test="${page < maxPage }">
			<a>&raquo;</a>
		</c:if>
	</td>
</tr>