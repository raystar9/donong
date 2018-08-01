<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/donong/resources/service/css/cs_header.css" type="text/css">

<div id="cs_header">
	<span>Donong</span>&nbsp; <span>고객센터</span> <span>고객님과 함께하는 Donong 고객센터입니다.</span>
</div>

<div id="faqSrcBar">
	<form action="/donong/cs/faq" method="get">
		<label id="faqLabel"><span>FAQ</span> 검색</label>
		<div id="col2">
			<div id="col2-row1">검색을 이용하시면 보다 빠르게 원하시는 답변을 얻으실 수 있습니다.</div>
			<input type="text" id="keyword" name="keyword" placeholder=" 검색 후 문의가 해결되지 않으면 1:1 상담을 이용하세요." value="${keyword }" />
			<input type="submit" value="검색" />
		</div>
		<div id="col3">
			<input type="button" id="qnaBtn" value="1:1 상담하기" onclick="location.href='/donong/cs/qna'" />
		</div>
	</form>			
</div>