<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ include file="/resources/common/jsp/import.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>나만따라와 도시농부</title>
	<script src="/donong/resources/service/js/faq.js"></script>
	
	<link rel="stylesheet" href="/donong/resources/service/css/faq.css" type="text/css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="cs">
	
		<%@ include file="/WEB-INF/views/service/cs_header.jsp" %>
				
		<c:if test="${sessionBean.nickname == 'admin' }">
			<a href="/donong/cs/faq/write">글쓰기</a>
		</c:if>
		
		<div id="src_header">
			<div id="src_header_row1">
				<span>FAQ</span>
				<span>검색결과</span>
			</div>
			<div id="src_header_row2">
				<span>"${keyword }"</span>&nbsp;
				<span>관련 총 </span>
				<span>${listCount }개</span>
				<span>의 FAQ가 검색되었습니다.</span>
			</div>
		</div>
		
		<c:if test="${listCount != 0 }">
			<div id="faqList">
			
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
			</div>
		</c:if>
			
		<c:if test="${listCount == 0 }">
			<div id="noSrcResult">
				<h3>"${keyword }" 에 해당하는 검색 결과가 없습니다. 다시 검색하여 주세요. <br /><br />질문하신 내용에서 띄어쓰기, 맞춤법, 검색한 어휘 등에 대해 다시 한 번 확인 부탁드립니다.</h3>
			</div>
		</c:if>
	</div>
</body>
</html>