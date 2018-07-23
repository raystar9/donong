<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
	<script src="/donong/resources/service/js/cs_main.js"></script>
	
	<link rel="stylesheet" type="text/css" href="/donong/resources/service/css/cs_main.css">
</head>
<body>
	<h1>
		CS 메인 페이지 입니다.  
	</h1>
	<a href="/donong/cs/main">main</a>
	<a href="/donong/cs/notice">notice</a>
	<a href="/donong/cs/qna">qna</a>
	
	<div id="faqSrcBar">
		<form action="/donong/cs/faq" method="get">
			<label id="faqLabel">FAQ 검색</label>
			<p>검색을 이용하시면 보다 빠르게 원하시는 답변을 얻으실 수 있습니다.</p>
			<input type="text" id="keyword" name="keyword" placeholder="검색 후 문의가 해결되지 않으면 1:1 상담을 이용하세요." />
			<input type="submit" value="검색" />
			<input type="button" value="1:1 상담" onclick="location.href='/donong/cs/qna'" />
		</form>
	</div>
	
	<br /><br /><br /><br />
	<table id="boardList">
		<tr>
			<th colspan="3">공지사항</th>
		</tr>

		<c:forEach var="content" items="${noticeList }">
			<tr>
				<td>
					❁
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
	</table>
	
	
	
	<br /><br /><br /><br />
	<table id="boardList">
		<tr>
			<th colspan="3">자주 묻는 질문 TOP 10</th>
		</tr>
		<c:set var="num" value="1"/>
		<c:forEach var="content" items="${faqList }">
			<tr>
				<td>
					❁ ${num }
					<c:set var="num" value="${num + 1 }" />
				</td>
				<td>
					<div>
						<a href="/donong/cs/faq?keyword=${content.title }">
							${content.title } 
						</a>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>
