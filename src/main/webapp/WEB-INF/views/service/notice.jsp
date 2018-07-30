<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
	<script src="/donong/resources/service/js/notice_list.js"></script>
	
	<link rel="stylesheet" href="/donong/resources/service/css/notice.css" type="text/css">	
	
</head>
<body>
	<h1>
		공지사항 페이지 입니다.  
	</h1>
	<a href="/donong/cs/main">main</a>
	<a href="/donong/cs/notice">notice</a>
	<a href="/donong/cs/qna">qna</a>
	
	<table id="boardList">
		<c:if test="${listCount != 0 }">
			<tr>
				<th colspan="3">공지사항</th>
			</tr>
			<tr>
				<th width="10%">번호</th>
				<th width="70%">제목</th>
				<th width="20%">등록일</th>
			</tr>

			<c:set var="num" value="${listCount - (page - 1) * 10 }"/>
			<c:forEach var="content" items="${noticeList }">
				<tr>
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
			</td>
			
			<td colspan="2">
				<input type="text" id="srcTxt" name="searchTxt" />
				<input type="button" id="srcBtn" value="검색" />
			</td>
			
			<%-- <c:if test="${id = 'admin' }"> --%>
				<td style="text-align: right;">
					<a href="./notice/write">[글쓰기]</a>
				</td>
			<%-- </c:if> --%>
		</tr>
	</table>
	
	<table>
		<c:if test="${listCount == 0 }">
			<tr>
				<th colspan="4">공지사항</th>
				<th style="text-align: right;">
					<font size="2">등록된 글이 없습니다.</font>
				</th>
			</tr>
			<tr>
				<td colspan="5" style="text-align: right;">
					<a href="./bbs_write.nhn">[글쓰기]</a>
				</td>
			</tr>
		</c:if>
	</table>

</body>
</html>