<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/common/jsp/import.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	
	<script src="/donong/resources/service/js/notice.js"></script>
	
	<link rel="stylesheet" href="/donong/resources/service/css/notice.css" type="text/css">	
	
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="cs">
	
		<%@ include file="/WEB-INF/views/service/cs_header.jsp" %>
	
		<div id="notice_title">
			공지사항  
		</div>
		
		<table id="boardList">
			<c:if test="${listCount != 0 }">
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
			</c:if>
		</table>
		
		<table>			
			<tr>
				<td>
					<select id="srcOpt">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" id="srcTxt" name="searchTxt" />
					<input type="button" id="srcBtn" value="검색" />
				</td>
			</tr>
			<c:if test="${sessionBean.nickname == 'admin' }">
				<tr>
					<td style="text-align: right;">
						<a href="./notice/write">[글쓰기]</a>
					</td>
				</tr>
			</c:if>
		</table>

	</div>
</body>
</html>