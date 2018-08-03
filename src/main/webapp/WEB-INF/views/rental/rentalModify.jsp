<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/common/jsp/import.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/donong/resources/rental/css/rentalModify.css">
<script src="/donong/resources/rental/js/rentalModify.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHdzdDM31uM0W0KvSAVn1awYGp0ujKE_g&callback=initMap&libraries=places"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div id="page-header-size">
    <h2 id='viewTitle'>농지 대여</h2><hr>      
</div>
<div class="container" id="con">
 <form action="./modify_ok" method="post" class="modifyForm" enctype="multipart/form-data">
 <input type="hidden" value="${rental.num }" name="num">
 <input type="hidden" name="directory" value="rent" />
	<table class="modifyTable">
		<tr>
			<td>임대자</td>
			<td>
				${member.realname} 
			</td>
		</tr> 
		<tr>
			<td>연락처</td>
			<td>
				${member.phone}
			</td>
		</tr>
		<tr>
			<td>면적</td>
			<td>
				<span>
					<input type="text" name="area" id="area" placeholder="1,000" class="form-control" value="${rental.area }">&nbsp;
					</span>py
			</td>
		</tr>
		<tr>
			<td>임대료</td>
			<td>
				<span>
					<input type="text" name="price" id="price" class="form-control" value="${rental.price }">&nbsp;원
				</span>
			</td>
		</tr>
		<tr>
			<td>대표이미지</td>
			<td>
				<label for="file1"><img src="../resources/rental/image/upload.png" alt="파일열기" class="uploadIcon"/></label>
				<input type="file" name="file1" id="file1">
				<span id="filevalue1">${file.fileName1 }</span>&nbsp;
			</td>
		</tr>
		<tr id='file2_tr'>
			<td>사진1</td>
			<td>
				<label for="file2"><img src="../resources/rental/image/upload.png" alt="파일열기" class="uploadIcon"/></label>
				<input type="file" name="file2" id="file2">
				<span id="filevalue2">${file.fileName2 }</span>&nbsp;
			</td>
		</tr>
		<tr id='file3_tr'>
			<td>사진2</td>
			<td>
				 <label for="file3"><img src="../resources/rental/image/upload.png" alt="파일열기" class="uploadIcon"/></label>
				 <input type="file" name="file3" id="file3">
				 <span id="filevalue3">${file.fileName3 }</span>&nbsp;
			</td>
		</tr>
		<tr id='file4_tr'>
			<td>사진3</td>
			<td>
				<label for="file4"><img src="../resources/rental/image/upload.png" alt="파일열기" class="uploadIcon"/></label>
				<input type="file" name="file4" id="file4" class="form-control">
				<span id="filevalue4">${file.fileName4 }</span>&nbsp;
			</td>
		</tr> 
		<tr>
			<td>상세설명</td>
			<td style="padding:8px;">
				<textarea name="content" cols="50" rows="20" placeholder="농지에 대한 자세한 설명을 입력해주세요." id="content">${rental.content }</textarea>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" placeholder="&nbsp;농지 위치를 설정하세요." id="autocomplete" name="address" value="${rental.address }">
			</td>
		</tr>
		<tr>
			<td>지도</td>
			<td><div id="map"></div><div id="warn"><img src="../resources/rental/image/strong2.png" id='mark'/>&nbsp;(주소와 위치가 일치하는지 확인하세요)&nbsp;<img src="../resources/rental/image/strong2.png" id='mark'/></div></td>
		</tr>
	</table>
	
	<input type='hidden' id="markerLat" name="lat" value="${rental.lat }">
	<input type='hidden' id="markerLng" name="lng" value="${rental.lng }">
	<div class="container" id="button">
		<input type="submit" value="수정" class="btn btn-default">
		<input type="button" value="취소" onclick="can_click()" class="btn btn-default">
	</div>	
	</form>
</div>
</body>
</html>