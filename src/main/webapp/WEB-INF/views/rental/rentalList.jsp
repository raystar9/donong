<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
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
		height: 700px;
		margin-bottom: 70px;
	}
	#searchTable{
		width: 600px;
		margin: 0 auto;
		margin-top: 30px;
	}
	#list_table{
		text-align: center;
		width: 140px;
		height: 160px;
		font-size: 12px;
		margin-left: 10px;
		margin-right: 10px;
		margin-top:20px;
		display: inline-block;
		border: 1px solid #444444
		
	}
	#main{
		margin-left: 400px;
	}
</style>
</head>
<body>

<div id="main">
<div id="searchBox">
	<form action="rental/search" class="searchForm">
		<table border="1" id="searchTable" >
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
<div id="List" style="overflow-y:scroll;">
	<c:forEach var="r" items="${list}">
		<table id="list_table">
			<tr>
				<td><img src="../resources/rental/upload${r.path }" width="130px" height="100px"></td>
			</tr>
			<tr>
				<td>${r.title }</td>
			</tr>
			<tr>
				<td>${r.area }㎡</td>
			</tr>
			<tr>
				<td>월 ${r.price }원</td>
			</tr>
		</table>
	</c:forEach>
</div>

</div>

</body>
</html>