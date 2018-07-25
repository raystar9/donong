<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHdzdDM31uM0W0KvSAVn1awYGp0ujKE_g&callback=initMap&libraries=places"></script>
<script src="/donong/resources/rental/js/rentalWrite.js"></script>
<title>대여 작성 페이지</title>
<style>
	*{
		box-sizing:border-box;
	}
	#main{
		margin: auto;
		border:1px solid black;
		width:800px;
		height:1500px;
	}
	.writeTable{
		margin: auto;
		margin-top: 50px;
		width: 700px;
	}
	#map {
		width: 400px;
		height: 400px;
		margin: auto;
		margin-top : 20px;
	}
	#autocomplete{
		margin-top:50px;
		width: 500px;
		height: 35px;
	}
	#search{
		margin-top:50px;
		margin: auto;
		text-align: center;
	}
	table tr td:first-child {
		width: 150px;
	}
</style>
</head>
<body>
<div id="main">
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
				<input type="text" name="price" id="price" class="form-control">&nbsp;원
				</div>
			</td>
		</tr>
		<tr>
			<td>대표이미지</td>
			<td>
				 <input type="file" name="file1" id="file1" class="form-control">
			</td>
		</tr>
		<tr id='file2_tr'>
			<td>사진1</td>
			<td>
				 <input type="file" name="file2" id="file2" class="form-control">
			</td>
		</tr>
		<tr id='file3_tr'>
			<td>사진2</td>
			<td>
				 <input type="file" name="file3" id="file3" class="form-control">
			</td>
		</tr>
		<tr id='file4_tr'>
			<td>사진3</td>
			<td>
				 <input type="file" name="file4" id="file4" class="form-control">
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
		<input type="submit" value="등록">
		<input type="button" value="취소" onclick="location.href='../rental'">
	</div>	
	</form>
</div>
</body>
</html>