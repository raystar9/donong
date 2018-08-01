<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ include file="/resources/common/jsp/import.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<script src="/donong/resources/service/js/notice_cont.js"></script>
	
	<link rel="stylesheet" href="/donong/resources/service/css/notice_cont.css" type="text/css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="cs">
	
		<%@ include file="/WEB-INF/views/service/cs_header.jsp" %>
		
		<div id="notice_title">
			공지사항  
		</div>
		
		<div id="notice_table">
			
			<label>번호</label>
			<span>${notice.num }</span>
			
			<label>제목</label>
			<span>${notice.title }</span>
			
			<label>내용</label>
			<div id="notice_content">
				${notice.content }
			</div>
			<label>등록일</label>
			<span>${notice.regitdate }</span>
	
			<button onclick="location.href='/donong/cs/notice/${notice.num}?state=edit'">수정</button>
			<f:form method="delete" action="/donong/cs/notice/${notice.num }">
				<input id="deleteBtn" type="submit" value="삭제" />
			</f:form>
			<button onclick="location.href='/donong/cs/notice'">목록으로</button>
		</div>
		
	</div>
	
</body>
</html>