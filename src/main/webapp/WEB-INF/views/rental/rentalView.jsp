<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHdzdDM31uM0W0KvSAVn1awYGp0ujKE_g&callback=initMap"></script>
<script src="/donong/resources/rental/js/rentalView.js"></script>
<style>
	*{
		box-sizing:border-box;
	}
	.img{
		width:100%;
		height:100%;
	}
	#content{
		border:1px solid black;
		width:900px;
		height:407px;
		margin-top:10px;
		font-size:15px;
	}
	#represent{
		border:1px solid black;
		height:178px;
		display:inline-block;
		width:250px;
	}
	#map{
		width:500px;
		height:300px;
		margin-bottom: 50px;
		margin-top: 50px;
	}
	.writeTable{
		width:650px;
		height:180px;
		float:left;
	}
	#representImg{
		width:100%;
		height:100%;
	}
	#main{
		margin-left:350px;
		margin-top: 50px;
	}
	#areaBox{
		font-size:17px;
		border:0px;
		padding:15px;
	}
	#images{
		margin-top:30px;
		width:900px;
		height:400px;
		border:1px solid black;
	}
	#separation{
		border:1px solid black;
		width:380px;
		height:100%;
		float:right;
		padding: 10px;
		padding-top:25px;
	}
	.sepatateImg{
		border:1px solid black;
		width:160px;
		height:160px;
		display:inline-block;
		margin:7px;
	}
	#bigImg{
		width:518px;
		height:100%;
		border:1px solid;
		display:inline-block;
		padding:25px;
		padding-left:32px;
	}
	#big{
		width:450px;
		height:350px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대여 상세보기 페이지</title>
</head>
<body>

<input type="hidden" id="lat" value="${rental.lat }"/>
<input type="hidden" id="lng" value="${rental.lng }"/>
<div id="main">
	<table border="1" class="writeTable">
		<tr>
			<td>번호</td>
			<td>
				${rental.num}
			</td>
		</tr>
		<tr>
			<td>소재지</td>
			<td>
				${rental.address}
			</td>
		</tr>
		<tr>
			<td>면적</td>
			<td>
				${rental.area}
			</td>
		</tr>
		<tr>
			<td>임대료</td>
			<td>
				${rental.price}
			</td>
		</tr>
		<tr>
			<td rowspan='2'>문의</td>
			<td>
				${member.realname}
			</td>
		</tr>
		<tr>
			<td>
				${member.phone}
			</td>
		</tr>
	</table>
	
	<div id="represent">
		<img src="../resources/rental/upload${file.filePath1 }" id='representImg'/>
	</div>	<!-- 대표이미지 넣는 곳 -->
	
	<!-- 상세내용 넣는 곳 -->
	<div id="content"> 
		<textarea rows='19' cols='95' id='areaBox'>${rental.content }</textarea>
	</div>		
	
	<!-- 이미지들 넣는 곳 -->
	<div id="images">
		<div id='bigImg'>
			<img src="../resources/rental/upload${file.filePath1 }" class='img' id='big'/>
		</div>
		<div id='separation'>
			<div id='Img1' class="sepatateImg">
			 	<c:if test="${file.fileName1 eq 'default2.png'}">
					<img src="../resources/rental/upload${file.filePath1 }" class='img'/>
			 	</c:if>
			</div>
			<div id='Img2' class="sepatateImg">
				<img src="../resources/rental/upload${file.filePath2 }" class='img'/>
			</div>
			<div id='Img3' class="sepatateImg">
					<img src="../resources/rental/upload${file.filePath3 }" class='img'/>
			</div>
			<div id='Img4' class="sepatateImg">
				<img src="../resources/rental/upload${file.filePath4 }" class='img'/>
			</div>
		</div>
	</div>
	
	
	<!-- 지도 넣는 곳 -->
	<div id="map"></div>		
		
</div>
</body>
</html>