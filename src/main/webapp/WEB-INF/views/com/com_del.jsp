<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="com_del.nhn" method="post" name="boardform">
<input type="hidden" name="com_num" value="${bbsbean.com_num }">
<input type="hidden" name="page" value="${page}">
<table>
	<tr class="center">
		<th colspan="2">커뮤니티 게시판 삭제</th>
	</tr>
	
	
	<tr>
		<td><div>비밀번호</div></td>
		<td>
			<input name="com_pass" id="com_pass"
					type="password" size="5" maxlength="10" >
		</td>
	</tr>
	

	<tr class="center">
		<td colspan="2" class="h30 lime">
			<input type="submit" value="삭제">
			<input type="reset" value="취소" onClick="history.go(-1)">
		</td>
	</tr>
</table>
</form>
</body>
</html>