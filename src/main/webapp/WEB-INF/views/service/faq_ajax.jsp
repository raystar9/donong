<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>

<div>
	<h3>번호</h3>
	<h3>제목</h3>
</div>

<c:set var="num" value="${listCount - (page - 1) * 10 }"/>
<c:forEach var="content" items="${faqList }">
	<div class="faqRow">
		<button class="accordian" value="${content.num }">
			<c:out value="${num }" />
			<c:set var="num" value="${num - 1 }" />
			&nbsp;&nbsp;&nbsp;
			<c:set var="attatchedStr" value="[${content.category}] ${content.title}"/>
			<c:set var="contentArr" value="${attatchedStr.split(keyword)}"/>
			<c:choose>
				<c:when test="${fn:length(contentArr) == 1 }">
					<c:choose>
						<c:when test="${!fn:contains(content.title, keyword)}">
							${contentArr[0]}
						</c:when>
						<c:otherwise>									
							${contentArr[0]}<font color="#FF0000">${keyword}</font>
						</c:otherwise>
					</c:choose>
				</c:when>
				
				<c:when test="${fn:length(contentArr) >= 2 }">
					${contentArr[0]}<c:forEach var="i" begin="1" end="${fn:length(contentArr) - 1 }"><font color="#FF0000">${keyword}</font>${contentArr[i]}</c:forEach>
				</c:when>
			</c:choose>
			
		</button>
		<div class="panel">
			${content.content }
		</div>
	</div>
</c:forEach>

<div id="pagingTd">
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
</div>


			