<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
	<script src="/donong/resources/service/js/faq.js"></script>
	
	<link rel="stylesheet" href="/donong/resources/service/css/faq.css" type="text/css">
</head>
<body>
	<a href="/donong/cs/main">main</a>
	<a href="/donong/cs/notice">notice</a>
	<a href="/donong/cs/qna">qna</a>
	
	<div id="faqList">
		<c:if test="${listCount != 0 }">
			<div id="faqSrcBar">
				<h4>FAQ 검색 결과</h4><p><span id="keyword">"${keyword }"</span> 관련 총 <span id="listCount">${listCount }</span>개의 FAQ가 검색되었습니다.</p>
				<form action="/donong/cs/faq" method="get">
					<label id="faqLabel">FAQ 검색</label>
					<p>검색을 이용하시면 보다 빠르게 원하시는 답변을 얻으실 수 있습니다.</p>
					<input type="text" id="keyword" name="keyword" placeholder="검색 후 문의가 해결되지 않으면 1:1 상담을 이용하세요." value="${keyword }" />
					<input type="submit" value="검색" />
					<input type="button" value="1:1 상담" onclick="location.href='/donong/cs/qna'" />
				</form>
			</div>
			
			<div>
				<h3>번호</h3>
				<h3>제목</h3>
			</div>

			<c:set var="num" value="${listCount - (page - 1) * 10 }"/>
			<c:forEach var="content" items="${faqList }">
				<div class="faqRow">
					<h3>
						<c:out value="${num }" />
						<c:set var="num" value="${num - 1 }" />
					</h3>
					<button class="accordian" value="${content.num }">
						${content.title }
					</button>
					<div class="panel">
						${content.content } <br />
						<span class="readCount">${content.readcount }</span>
					</div>
				</div>
			</c:forEach>
			
			<div id="pagingBar">
				<c:if test="${page <= 1 }">
					이전&nbsp;
				</c:if>
				<c:if test="${page > 1 }">
					<a>이전</a>
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
					&nbsp;다음
				</c:if>
				<c:if test="${page < maxPage }">
					<a>다음</a>
				</c:if>
			</div>
		</c:if>
		
		<c:if test="${listCount == 0 }">
			<div id="faqSrcBar">
				<h4>FAQ 검색 결과</h4><p><span id="keyword">"${keyword }"</span> 관련 총 <span id="listCount">${listCount }</span>개의 FAQ가 검색되었습니다.</p>
				<form action="/donong/cs/faq" method="get">
					<label id="faqLabel">FAQ 검색</label>
					<p>검색을 이용하시면 보다 빠르게 원하시는 답변을 얻으실 수 있습니다.</p>
					<input type="text" id="keyword" name="keyword" placeholder="검색 후 문의가 해결되지 않으면 1:1 상담을 이용하세요." />
					<input type="submit" value="검색" />
					<input type="button" value="1:1 상담" />
				</form>
			</div>
		
			<h3>${keyword } 에 해당하는 검색 결과가 없습니다. 다시 검색하여 주세요. <br />질문하신 내용에서 띄어쓰기, 맞춤법, 검색한 어휘 등에 대해 다시 한 번 확인 부탁드립니다.</h3>
		</c:if>
	</div>
</body>
</html>