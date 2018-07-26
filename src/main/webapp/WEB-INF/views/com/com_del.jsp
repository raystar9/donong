<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<form action="communitydel_ok" method="post" name="boardform">
<input type="hidden" name="num" value="${num }">
<input type="hidden" name="page" value="${page}">
<table>
	<tr class="center">
		<th colspan="2">커뮤니티 게시판 삭제</th>
		
	</tr>
	<tr class="center">
		<td colspan="2" class="h30 lime">
			<input type="submit" value="삭제" class="btn btn-lg">
			<input type="reset" value="취소" class="btn btn-lg" onClick="history.go(-1)">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>