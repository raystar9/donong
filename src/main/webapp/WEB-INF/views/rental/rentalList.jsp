<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대여 목록 페이지</title>
<style>
	#searchBox{
		border:1px solid black;
		width: 700px;
		height: 150px;
		margin-bottom: 80px;
	}
	#List{
		border:1px solid black;
		width: 700px;
		height: 150px;
	}
	#searchTable{
		width: 600px;
		margin: 0 auto;
		margin-top: 30px;
	}
</style>
</head>
<body>

<div id="main">
<div id="searchBox">
	<form action="rental/search" class="searchForm">
		<table border="1" id="searchTable">
			<tr>
				<td rowspan="3">토지 검색</td>
				<td>매물번호</td>
				<td colspan="2">
					<input type="text" name="id"  id="id">
				</td>
				<td rowspan="3">
					<input type="button" value="검색"> 
				</td>
			</tr>
			<tr>
				<td>지역</td>
				<td>
					<select name="si">
						<option value="1">시 예시</option>
					</select>
				</td>
				<td>
					<select name="">
						<option value="2">군 예시</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td colspan="2">
					<input type="text" name="price"  id="price">
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="List" style="overflow-y:scroll;">검색 목록 출력</div><!-- 리스트가 달릴 곳 -->
</div>

</body>
</html>