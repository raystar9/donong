<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>

<title>마이 페이지</title>
</head>
<body>
	 <c:if test = '${sessionBean.nickname == null }'>
		<script>
		alert("다시 로그인 하세요");
		location="member_login"
		</script>
	</c:if>


		<h2 class="main_title">구매내역</h2>
		<form method="POST" action="member_logout.nhn">
			<table>
				<tr>
					<th colspan="2">
						<input type="button" value="정보수정" class="input_button" onclick="location='member_edit'">
						<input type="button" value="회원탈퇴" class="input_button" onclick="location='member_del'">
						<input type="button" value="로그아웃" class="input_button" onclick="location='member_logout'">
					</th>
				</tr>
				
				<tr>
					<td>${sessionBean.nickname}님의 개인정보페이지 입니다.</td>
				</tr>
					
			</table>	
		</form>

</body>
</html>