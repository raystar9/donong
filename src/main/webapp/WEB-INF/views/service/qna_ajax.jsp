<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${listCount != 0 }">
<tr>
	<th width="10%">번호</th>
	<th width="15%">문의유형</th>
	<th width="45%">문의제목</th>
	<th width="10%">문의일</th>
	<th width="10%">답변일</th>
	<th width="10%">처리상태</th>
</tr>

<c:set var="num" value="${listCount - (page - 1) * 10 }"/>
<c:forEach var="content" items="${qnaList }">
	<tr class="qna_tr">
		<td>
			<c:out value="${num }" />
			<c:set var="num" value="${num - 1 }" />
		</td>
		<td>
			<c:choose>
				<c:when test="${content.category == 1}">
					고객정보
				</c:when>
				<c:when test="${content.category == 2}">
					주문/결제
				</c:when>
				<c:when test="${content.category == 3}">
					배송
				</c:when>
				<c:when test="${content.category == 4}">
					상품/상품평
				</c:when>
				<c:when test="${content.category == 5}">
					취소
				</c:when>
				<c:when test="${content.category == 6}">
					반품
				</c:when>
				<c:when test="${content.category == 7}">
					교환
				</c:when>
				<c:when test="${content.category == 8}">
					이벤트/제휴/기타
				</c:when>
				<c:when test="${content.category == 9}">
					고객의소리
				</c:when>
			</c:choose>
		</td>
		<td>
			<div>
				<a href="./qna/${content.num }?state=cont">
					${content.title } 
				</a>
			</div>
		</td>
		<td>${content.regitdate }</td>
		<td>${content.ansdate }</td>
		<td>${content.state }</td>
	</tr>
</c:forEach>
<tr>
	<td colspan="6" id="pagingTd">
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
</c:if>