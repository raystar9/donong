<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>
<div class="container">
<h2 class="comcont_title" style="witdh:370px">
정보게시판</h2>
<div id="boardcont_menu">
<div class="btn-group">
	 <ul class="nav nav-tabs">
    <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="info_start_1">시작하기
    <span class="caret"></span></a>
    
    <ul class="dropdown-menu" role="menu">
    <li><a href="info_start_1">농사계획</a></li>
    <li><a href="info_start_2">텃밭유형</a></li>
    <li><a href="info_start_3">재배작물 선택하기</a></li>
    <li><a href="info_start_4">작물배치도 만들기</a></li>
    <li><a href="info_start_5">허브작물 재배하기</a></li>
  </ul>
  

	<li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="info_farming_1">농사짓기
    <span class="caret"></span></a>
    
    <ul class="dropdown-menu" role="menu">
    <li><a href="info_farming_1">밭 만들기</a></li>
    <li><a href="info_farming_2">파종과 육모, 정식</a></li>
    <li><a href="info_farming_3">작물 돌보기</a></li>
    <li><a href="info_farming_4">비료와 농약</a></li>
    <li><a href="info_farming_5">태풍과 장마</a></li>
    <li><a href="info_farming_6">수확하기</a></li>
    <li><a href="info_farming_7">농사달력</a></li>
    <li><a href="info_farming_8">병해충 정보</a></li>
  
  </ul>
  
  </ul>
		</div>
		</div>
<h3>농사짓기</h3>
<h4>농사 단계를 선택하여 원하는 정보를 얻으세요.</h4>
<hr>
<ul class="nav nav-tabs">
  <li ><a href="info_farming_1">밭만들기</a></li>
 <li> <a href="info_farming_2" >파종과 육묘, 정식</a></li>
 <li  class="active">  <a href="info_farming_3" >작물돌보기</a></li>
   <li> <a href="info_farming_4" >비료와 농약</a></li>
    <li><a href="info_farming_5" >태풍과 장마</a></li>
    <li><a href="info_farming_6" >수확하기</a></li>
    <li><a href="info_farming_7" >농사달력</a></li>
   <li> <a href="info_farming_8" >병해충 정보</a></li>
</ul>
<hr>

<div id="boardcont_menu">
	
		<input type="button" value="목록" class="btn" onclick="location='info'">
		</div>
</div>
</body>
</html>