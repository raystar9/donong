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
<h3>재배작물 선택하기</h3>
<h4>도시농업에 적합한 재배작물의 정보를 제공합니다.</h4>
<hr>


<h3>고추</h3><h5>체내 지방을 분해하여 비만을 예방해주는 다이어트 식품</h5>
<div class="container">
<div class="col-sm-3" style="float:left;">
<img src="resources/images/crop1.jpg">
</div>
<div class="col-sm-8" style="float:right;">

<table style="width:100%; height:186px;" class="table table-bordered">
<tr>
<th>분류</th>
<td>가지과</td>
<th>난이도</th>
<td>★★★</td>
</tr>
<tr>
<th>싹이 트는 온도</th>
<td>28~30°C</td>
<th>생육온도</th>
<td>25~28°C</td>
</tr>
<tr>
<th>재배시기</th>
<td>2월 상순 ~ 5월 하순</td>
<th>재배기간</th>
<td>90일</td>
</tr>
<tr>
<th>원산지</th>
<td>중앙아메리카</td>
<th>연작피해</th>
<td>있음[약함]</td>
</tr>

</table>
</div>
</div>

<br>
<h5>텃밭은 면적이 작기 때문에 고추를 많이 심을 수 없으므로 건고추용 품종보다는 풋고추용 고추를 심어 이용하는 것이 좋으며, 품종에 따라 매운맛의 정도가 다르므로 식성에 따라 매운맛 정도를 골라서 심어야 한다. 심는 시기는 늦서리가 끝나는 5월에 심어야 안전하며 4월로 앞당겨 심으면 늦서리 피해를 받을 수 있다. 고추는 꽃이 개화하여 붉은고추로 따려면 최소 40일 이상 소요되며 이 기간 동안 병해충 피해를 받을 우려가 있으므로 텃밭의 고추는 풋고추로 수확하여 이용하는 것이 바람직하다.</h5>
<hr>
<div id="boardcont_menu" style="float:right;">
	
		<input type="button" value="목록" class="btn" onclick="location='info'">
		</div>
</div>
</body>
</html>