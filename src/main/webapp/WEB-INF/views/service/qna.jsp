<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ include file="/resources/common/jsp/import.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	
	<script src="/donong/resources/service/js/qna.js"></script>
	
	<link rel="stylesheet" href="/donong/resources/service/css/qna.css" type="text/css">	
	
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="cs">
	
		<%@ include file="/WEB-INF/views/service/cs_header.jsp" %>

		<c:if test="${sessionBean.nickname != 'admin' }">
			<div id="write_form_div">
				<h2><span>Donong</span>&nbsp;에 문의하기</h2>
				<f:form method="post" action="/donong/cs/qna">
					<label>분류</label> 
					<select name="category" id="category">
						<option value="0" selected="selected">선택</option>
						<option value="1">고객정보</option>
						<option value="2">주문/결제</option>
						<option value="3">배송</option>
						<option value="4">상품/상품평</option>
						<option value="5">취소</option>
						<option value="6">반품</option>
						<option value="7">교환</option>
						<option value="8">이벤트/제휴/기타</option>
						<option value="9">고객의소리</option>
					</select>
					<label>제목</label><input id="title" name="title" />
					<label>내용</label><textarea id="content" name="content"></textarea>
					
					<div id="sub_reset">
						<input type="submit" value="등록"><input type="reset" value="취소">
					</div>
				</f:form>
			</div>
		</c:if>
		
		
		<h2 id="qna_title">나의 문의내역</h2>
				
		<table id="boardList">
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
		</table>
		
		<table>
			<c:if test="${listCount == 0 }">
				<tr>
					<th width="10%">번호</th>
					<th width="15%">문의유형</th>
					<th width="45%">문의제목</th>
					<th width="10%">문의일</th>
					<th width="10%">답변일</th>
					<th width="10%">처리상태</th>
				</tr>
				<tr>
					<th colspan="6">
						<font size="2">문의 내역이 존재하지 않습니다.</font>
					</th>
				</tr>
			</c:if>
		</table>
		
	</div>
</body>
</html>
