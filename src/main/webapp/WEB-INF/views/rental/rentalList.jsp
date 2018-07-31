<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/common/jsp/import.jsp" %>
<script src="/donong/resources/rental/js/rentalList.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHdzdDM31uM0W0KvSAVn1awYGp0ujKE_g&callback=initMap&libraries=places"></script>
<style>
	*{
		box-sizing:border-box;
	}
	#btnwrite{
		float:right;
	}
	#btn{
		width:1000px;
		margin-top:5px;
		margin-bottom:5px;
		height:32px;
	}
	#searchBox{
		border:1px solid black;
		width: 1000px;
		height: 150px;
		margin-bottom: 10px;
		margin-top: 100px;
	}
	#List{
		border:1px solid black;
		width: 1000px;
		height: 700px;
		margin-bottom: 70px;
		padding: 10px;
		text-align:center;
	}
	#searchTable{
		width: 600px;
		margin: 0 auto;
		margin-top: 30px;
	}
	.list_table{
		text-align: center;
		width: 140px;
		height: 200px;
		display: inline-block;
		border: 1px solid #444444
		
	}
	#main{
		margin-left: 300px;
	}
	.viewbox{
		text-align: center;
		border: 1px solid black;
		width: 180px;
		height: 225px;
		font-size: 13px;
		margin-left: 10px;
		margin-right: 10px;
		margin-top:10px;
		display: inline-block;
	}
	.img{
		margin-bottom: 10px;
		width: 100%;
		border-bottom: 1px solid black;
		height:120px;
	}
	.row{
		margin-bottom: 3px;
	}
	#map {
		width: 1000px;
		height: 300px;
		margin: auto;
		margin-top : 20px;
		margin-bottom : 20px;
		display:inline-block;
	}
	#top{
		height:20px;
		background:#277623;
		color:white;
		width:100%;
	
	}
	.mark{
		width:13px;
		height:13px;
	}
	.searchNo{
		width:500px;
		height:400px;
		margin-top:100px;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div id="main">
<div id="searchBox">
		<table border="1" id="searchTable" >
			<tr>
				<td rowspan="3">토지 검색</td>
				<td>번호</td>
				<td colspan="2">
					<input type="text" name="num"  id="num">
				</td>
				<td rowspan="3">
					<input type="button" value="검색" id="searchBtn" onclick="search();"> 
				</td>
			</tr>
			<tr>
				<td>지역</td>
				<td> 
					<select name="sido" id="sido">
					</select>
				</td>
				<td>
					<select name="sigungu" id="sigungu">
						<option value='0'>시,군,구 </option>
					</select>
				</td>
			</tr>
			<tr>
				<td>임대료</td>
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

<div id="map"></div>
<div id="btn">
	<input type="button" value="글쓰기" onclick="location.href='./rental/write'" id="btnwrite" class="btn btn-default">
</div>

<div id="List" style="overflow-y:scroll;">
	<c:forEach var="r" items="${list}">
		<div class='viewbox'>
			<div id='top'>
				No.&nbsp;${r.num }
			</div>
			<div class='row'>
				<a href="./rental/view?num=${r.num }"><img src="/donong/rental/displayFile?fileName=${r.path }&directory=rent" class='img'></a>
			</div>
			<div class='row'>
				<img src="./resources/rental/image/flag.png" class='mark'/>&nbsp;${r.title }<br>
			</div>
			<div class='row'>
				<img src="./resources/rental/image/area3.png" class='mark'/>&nbsp;${r.area }㎡<br>
			</div>
			<div class='row'>
				<img src="./resources/rental/image/dollar.png" class='mark'/>&nbsp; ${r.price }원<br>
			</div>
		</div>
	</c:forEach>
</div>
</div>
</body>
</html>