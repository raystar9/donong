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
<div class="container" id="con">
 <form action="./write_ok" method="post" class="writeForm" enctype="multipart/form-data">
	<table border="1" class="writeTable">
		<tr>
			<td>임대자</td>
			<td>
				${name} 
			</td>
		</tr> 
		<tr>
			<td>연락처</td>
			<td>
				${phone}
			</td>
		</tr>
		<tr>
			<td>면적</td>
			<td>
				<input type="text" name="area" id="area" placeholder="1,000" class="form-control">&nbsp;py
			</td>
		</tr>
		<tr>
			<td>임대료</td>
			<td>
				<div style='width:100px; display:inline-block'>
				<input type="text" name="price" id="price">&nbsp;원
				</div>
			</td>
		</tr>
		<tr>
			<td>대표이미지</td>
			<td>
				<label for="file1"><img src="../resources/rental/image/upload.png" alt="파일열기" class="uploadIcon"/></label>
				<input type="file" name="file1" id="file1">
				<span id="filevalue1"></span>&nbsp;
			</td>
		</tr>
		<tr id='file2_tr'>
			<td>사진1</td>
			<td>
				<label for="file2"><img src="../resources/rental/image/upload.png" alt="파일열기" class="uploadIcon"/></label>
				<input type="file" name="file2" id="file2">
				<span id="filevalue2"></span>&nbsp;
			</td>
		</tr>
		<tr id='file3_tr'>
			<td>사진2</td>
			<td>
				 <label for="file3"><img src="../resources/rental/image/upload.png" alt="파일열기" class="uploadIcon"/></label>
				 <input type="file" name="file3" id="file3">
				 <span id="filevalue3"></span>&nbsp;
			</td>
		</tr>
		<tr id='file4_tr'>
			<td>사진3</td>
			<td>
				 <label for="file4"><img src="../resources/rental/image/upload.png" alt="파일열기" class="uploadIcon"/></label>
				 <input type="file" name="file4" id="file4" class="form-control">
				 <span id="filevalue4"></span>&nbsp;
			</td>
		</tr> 
		<tr>
			<td>상세설명</td>
			<td>
				<textarea name="content" cols="50" rows="20" placeholder="농지에 대한 자세한 설명을 입력해주세요." id="content" class="form-control"></textarea>
			</td>
		</tr>
	</table>
	
	<div id="search">
		주소:&nbsp;<input type="text" placeholder="농지 위치를 설정하세요." id="autocomplete" name="address"><br>
		(주소와 위치가 일치하는지 확인하세요)
	</div>
	<div id="map">
	</div>
	<input type='hidden' id="markerLat" name="lat" value="">
	<input type='hidden' id="markerLng" name="lng" value="">
	<div class="button">
		<input type="submit" value="등록" class="btn btn-default">
		<input type="button" value="취소" onclick="location.href='../rental'" class="btn btn-default">
	</div>	
	</form>
</div>
</body>
</html>