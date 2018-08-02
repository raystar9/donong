<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/common/jsp/import.jsp" %>
<link rel="stylesheet" type="text/css" href="/donong/resources/rental/css/rentalList.css">
<script src="/donong/resources/rental/js/rentalList.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHdzdDM31uM0W0KvSAVn1awYGp0ujKE_g&callback=initMap&libraries=places"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container" id="con">
<div id="searchBox">
	<span>
		<img src= './resources/rental/image/search3.png' id="searchLogo">
	</span>
	<div id="box">
		<table id="searchTable" border="1">
			<tr>
				<td style="width:25%"><strong>번호</strong></td>
				<td colspan="2">
					<div style="width:150px;"><input type="text" name="num" id="num" class="form-control" style="height:25px"></div>
				</td>
				<td rowspan="3">
					<input type="button" value="검색" id="searchBtn" onclick="search();" class="btn-default"> 
				</td>
			</tr>
			<tr>
				<td><strong>지역</strong></td>
				<td> 
					<select name="sido" id="sido">
					</select>
					<select name="sigungu" id="sigungu">
						<option value='0'>시,군,구 </option>
					</select>
				</td>
			</tr>
			<tr>
				<td><strong>임대료</strong></td>
				<td colspan="2">
					<select name="price" id="price">
						<option value="0">선택</option>
						<option value="10000">10000원 ~ 20000원</option>
						<option value="20000">20000원 ~ 30000원</option>
						<option value="30000">30000원 ~ 40000원</option>
						<option value="40000">40000원 ~ 50000원</option>
						<option value="50000">50000원 ~ 이상</option>
					</select>
				</td>
			</tr>
		</table>
	</div>
</div>

<div id="map"></div>
<div id="btn">
	<input type="button" value="글쓰기" onclick="location.href='./rental/write'" id="btnwrite" class="btn btn-default">
</div>

<div id="List">
	<c:forEach var="r" items="${list}">
		<div class='viewbox'>
			<div id='top'>
				<strong>No.&nbsp;${r.num }</strong>
			</div>
			<div class='row2'>
				<a href="./rental/view?num=${r.num }"><img src="/donong/rental/displayFile?fileName=${r.path }&directory=rent" class='img'></a>
			</div>
			<div class='row2'>
				<img src="./resources/rental/image/flag.png" class='mark'/>&nbsp;${r.title }<br>
			</div>
			<div class='row2'>
				<img src="./resources/rental/image/area3.png" class='mark'/>&nbsp;${r.area }㎡<br>
			</div>
			<div class='row2'>
				<img src="./resources/rental/image/dollar.png" class='mark'/>&nbsp; ${r.price }원<br>
			</div>
		</div>
	</c:forEach>
</div>
</div>
</body>
</html>