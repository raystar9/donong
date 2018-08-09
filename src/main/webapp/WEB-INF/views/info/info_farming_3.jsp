<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/common/jsp/import.jsp" %>
<title>나만따라와 도시농부</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		
		<h3>농사짓기</h3>
		<h4>농사 단계를 선택하여 원하는 정보를 얻으세요.</h4>
		<hr>
		<ul class="nav nav-tabs">
			<li><a href="info_farming_1">밭만들기</a></li>
			<li><a href="info_farming_2">파종과 육묘, 정식</a></li>
			<li class="active"><a href="info_farming_3">작물돌보기</a></li>
			<li><a href="info_farming_4">비료와 농약</a></li>
			<li><a href="info_farming_5">태풍과 장마</a></li>
			<li><a href="info_farming_6">수확하기</a></li>
			<li><a href="info_farming_7">농사달력</a></li>
			<li><a href="info_farming_8">병해충 정보</a></li>
		</ul>
		<hr>
		<div class="bbs_view_cont bbs_view_cont_1">
			<img
				src="resources/images/info_farming_3.jpg"><br>
			<img
				src="resources/images/info_farming_31.jpg"><br>
			<br>

		</div>
<hr><hr>
		<div id="boardcont_menu" style="float:right;">

			<input type="button" value="목록" class="btn" onclick="location='info'">
		</div>
	</div>
</body>
</html>