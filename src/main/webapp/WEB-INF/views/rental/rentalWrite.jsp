<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/common/jsp/import.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/donong/resources/rental/css/rentalWrite.css">
<script src="/donong/resources/rental/js/rentalWrite.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHdzdDM31uM0W0KvSAVn1awYGp0ujKE_g&callback=initMap&libraries=places"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div id="page-header-size">
    <h2 id='viewTitle'>농지 대여</h2><hr>      
</div>
<div class="container" id="con">
 <form action="./write_ok" method="post" class="writeForm" enctype="multipart/form-data">
	<div id="window">
	<table class="writeTable">
		<tr style='height:35px;'>
			<td>임대자</td>
			<td>
				${name} 
			</td>
		</tr> 
		<tr style='height:35px;'>
			<td>연락처</td>
			<td>
				${phone}
			</td>
		</tr>
		<tr style='height:35px;'>
			<td>면적</td>
			<td>
				<input type="text" name="area" id="area" placeholder="1,000" class="form-control">&nbsp;py
			</td>
		</tr>
		<tr style='height:35px;'>
			<td>임대료</td>
			<td>
				<input type="text" name="price" id="price" class="form-control" placeholder="10,000">&nbsp;원
			</td>
		</tr>
		<tr style='height:35px;'> 
			<td>대표이미지</td>
			<td>
				<label for="file1"><img src="../resources/rental/image/upload.png" alt="파일열기" class="uploadIcon"/></label>
				<input type="file" name="file1" id="file1">
				<span id="filevalue1"></span>&nbsp;
			</td>
		</tr>
		<tr id='file2_tr' style='height:35px;'>
			<td>사진1</td>
			<td>
				<label for="file2"><img src="../resources/rental/image/upload.png" alt="파일열기" class="uploadIcon"/></label>
				<input type="file" name="file2" id="file2">
				<span id="filevalue2"></span>&nbsp;
			</td>
		</tr>
		<tr id='file3_tr' style='height:35px;'>
			<td>사진2</td>
			<td>
				 <label for="file3"><img src="../resources/rental/image/upload.png" alt="파일열기" class="uploadIcon"/></label>
				 <input type="file" name="file3" id="file3">
				 <span id="filevalue3"></span>&nbsp;
			</td>
		</tr>
		<tr id='file4_tr' style='height:35px;'>
			<td>사진3</td>
			<td>
				 <label for="file4"><img src="../resources/rental/image/upload.png" alt="파일열기" class="uploadIcon"/></label>
				 <input type="file" name="file4" id="file4" class="form-control">
				 <span id="filevalue4"></span>&nbsp;
			</td>
		</tr> 
		<tr>
			<td>상세설명</td>
			<td id="text_td">
				<textarea name="content" cols="50" rows="20" placeholder="농지에 대한 자세한 설명을 입력해주세요." id="content"></textarea>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" placeholder="&nbsp;농지 위치를 설정하세요." id="autocomplete" name="address">
			</td>
		</tr>
		<tr>
			<td>지도</td>
			<td><div id="map"></div><div id="warn"><img src="../resources/rental/image/strong2.png" id='mark'/>&nbsp;(주소와 위치가 일치하는지 확인하세요)&nbsp;<img src="../resources/rental/image/strong2.png" id='mark'/></div></td>
		</tr>
	</table>
	</div>
	<input type='hidden' id="markerLat" name="lat" value="">
	<input type='hidden' id="markerLng" name="lng" value="">
	</form>
</div>
	<div class="button">
		<input type="button" value="취소" onclick="can_click()" class="btn btn-default" id="canBtn">
		<input type="submit" value="등록" class="btn btn-default" id="subBtn">
	</div>	
</body>
</html>