<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대여 상세보기 페이지</title>
</head>
<body>

<div id="main">
	<table border="1" class="writeTable">
		<tr>
			<td>번호</td>
			<td>
				<!-- ${num} -->
			</td>
		</tr>
		<tr>
			<td>소재지</td>
			<td>
				<!-- ${address} -->
			</td>
		</tr>
		<tr>
			<td>면적</td>
			<td>
				<!-- ${area} -->
			</td>
		</tr>
		<tr>
			<td>임대가</td>
			<td>
				<!-- ${price} -->
			</td>
		</tr>
		<tr>
			<td>임대자</td>
			<td>
				<!-- ${writer} -->
			</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>
				<!-- ${phone} -->
			</td>
		</tr>
	</table>
	<div class="represent"></div>	<!-- 대표이미지 넣는 곳 -->
	<div class="content"></div>		<!-- 상세내용 넣는 곳 -->
	<div class="images"></div>		<!-- 이미지들 넣는 곳 -->
	<div class="map"></div>			<!-- 지도 넣는 곳 -->
</div>
</body>
</html>