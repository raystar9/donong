<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ include file="/resources/common/jsp/import.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	
	<script src="/donong/resources/service/js/qna_cont.js"></script>
	
	<link rel="stylesheet" href="/donong/resources/service/css/qna_cont.css" type="text/css">	
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="cs">
	
		<%@ include file="/WEB-INF/views/service/cs_header.jsp" %>
		
		<div id="qna_cont">
			<h1>1:1 문의 상세보기</h1>
			
			<label>문의유형</label>
			<span>
				<c:choose>
					<c:when test="${qna.category == 1}">
						고객정보
					</c:when>
					<c:when test="${qna.category == 2}">
						주문/결제
					</c:when>
					<c:when test="${qna.category == 3}">
						배송
					</c:when>
					<c:when test="${qna.category == 4}">
						상품/상품평
					</c:when>
					<c:when test="${qna.category == 5}">
						취소
					</c:when>
					<c:when test="${qna.category == 6}">
						반품
					</c:when>
					<c:when test="${qna.category == 7}">
						교환
					</c:when>
					<c:when test="${qna.category == 8}">
						이벤트/제휴/기타
					</c:when>
					<c:when test="${qna.category == 9}">
						고객의소리
					</c:when>
				</c:choose>
			</span>
			
			
			<label>작성자</label>
			<span>${sessionBean.nickname }</span>
			
			<label>문의제목</label>
			<span>${qna.title } </span>
			
			<label>문의내용</label>
			<span>${qna.content } </span>
			
			<label>문의일</label>
			<span>${qna.regitdate } </span>
			
			<label>처리상태</label>
			<span>${qna.state } </span>

			<c:if test="${sessionBean.nickname != 'admin' }">
				<c:if test="${qna.state.trim() != '답변 대기' }">
					<label>답변일</label>
					<span>${qna.ansdate } </span>
					<label>답변내용</label>
					<span>${qna.answer } </span>
				</c:if>
				<button onclick="location.href='/donong/cs/qna/${qna.num}?state=edit'">수정</button>
				<f:form method="delete" action="/donong/cs/qna/${qna.num }">
					<input id="deleteBtn" type="submit" value="삭제" />
				</f:form>
				<button onclick="location.href='/donong/cs/qna'">목록으로</button>
			</c:if>
			
			<c:if test="${sessionBean.nickname == 'admin' }">
				<f:form action="/donong/cs/qna/${qna.num }" method="put">
					<label>답변일</label>
					<span>${qna.ansdate } </span>
					
					<label>답변내용</label>
					<textarea name="answer" id="answer" cols="30" rows="10">${qna.answer } </textarea>
					
					<input id="updateReply" type="submit" value="답변 등록" />
				</f:form>
				<f:form method="delete" action="/donong/cs/qna/${qna.num }">
					<input id="deleteBtn" type="submit" value="삭제" />
				</f:form>
				<button onclick="location.href='/donong/cs/qna'">목록으로</button>
			</c:if>
		</div>
		
	</div>
	
	

</body>
</html>