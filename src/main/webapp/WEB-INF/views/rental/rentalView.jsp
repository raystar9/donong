<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<%@ include file="/resources/common/jsp/import.jsp" %>
<link rel="stylesheet" type="text/css" href="/donong/resources/rental/css/rentalView.css">
<script src="/donong/resources/rental/js/rentalView.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHdzdDM31uM0W0KvSAVn1awYGp0ujKE_g&callback=initMap"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<input type="hidden" id="lat" value="${rental.lat }"/>
<input type="hidden" id="lng" value="${rental.lng }"/>

<div id="page-header-size">
    <h2 id='viewTitle'>농지 대여</h2><hr>      
</div>
<div class="container" id="con">
<input type="hidden" id="board_num" value="${rental.num }"/>
	<div id='viewbtn'>
		<span id="No">No. ${rental.num}</span>
 		<input type="button" value="목록" onclick="location.href='../rental'" class="btn btn-default" style="margin-left:10px;"/>
 		<c:if test="${member_num eq member.num }">
 		  <input type="button" value="삭제" onclick="del_click()" class="btn btn-default" style="margin-left:10px"/>
 		  <input type="button" value="수정" onclick="location.href='../rental/modify?num=${rental.num}'" class="btn btn-default" style="margin-left:10px"/>
 		</c:if>
 	</div>
 	<div id="table_img">
	<table class="viewTable">
		
		<tr>
			<td>소재지</td>
			<td>
				${rental.address}
			</td>
		</tr>
		<tr>
			<td>면적</td>
			<td>
				${rental.area}㎡
			</td>
		</tr>
		<tr>
			<td>임대료</td>
			<td>
				${rental.price}원
			</td>
		</tr>
		<tr>
			<td>이름</td>
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
	</table>
	
	<div id="represent">
		<img src="/donong/rental/displayFile?fileName=${file.filePath1 }&directory=rent" id='representImg'/>
	</div>	<!-- 대표이미지 넣는 곳 -->
	</div>
	<!-- 상세내용 넣는 곳 -->
	<div id="content"> 
		<textarea id='areaBox' readOnly>${rental.content }</textarea>
	</div>		
	
	<!-- 이미지들 넣는 곳 -->
	<div id="images">
		<div id='bigImg'>
			<img src="/donong/rental/displayFile?fileName=${file.filePath1 }&directory=rent" class='img' id='big'/>
		</div>
		<div id='separation'>
			<div class="sepatateImg">
				 <img src="/donong/rental/displayFile?fileName=${file.filePath1 }&directory=rent" class='img' id='Img1' alt='/default.png'/>
			</div>
			<div class="sepatateImg">
				 <img src="/donong/rental/displayFile?fileName=${file.filePath2 }&directory=rent" class='img' id='Img2' alt='/default.png'/>
			</div>
			<div class="sepatateImg">
				 <img src="/donong/rental/displayFile?fileName=${file.filePath3 }&directory=rent" class='img' id='Img3' alt='/default.png'/>
			</div>
			<div class="sepatateImg">
				 <img src="/donong/rental/displayFile?fileName=${file.filePath4 }&directory=rent" class='img' id='Img4' alt='/default.png'/>
			</div>
		</div>
	</div>
	
	<!-- 지도 넣는 곳 -->
	<div id="map"></div>	
	
	</div>	

</body>
</html>