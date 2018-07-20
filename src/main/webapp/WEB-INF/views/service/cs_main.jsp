<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/donong/resources/service/css/a.css">
	<title>Home</title>
</head>
<body>
	<h1>
		CS 메인 페이지 입니다.  
	</h1>
	<a href="/donong/cs/main">main</a>
	<a href="/donong/cs/notice">notice</a>
	<a href="/donong/cs/search">search</a>
	<a href="/donong/cs/faq">faq</a>
	<a href="/donong/cs/qna">qna</a>
	
	<form action="/donong/cs/faq" method="get">
		<label id="faqLabel">FAQ 검색</label>
		<input type="text" id="keyword" name="keyword" placeholder="검색 후 문의가 해결되지 않으면 1:1 상담을 이용하세요." />
		<input type="submit" value="검색" />
		<input type="button" value="1:1 상담" />
	</form>
</body>
</html>
