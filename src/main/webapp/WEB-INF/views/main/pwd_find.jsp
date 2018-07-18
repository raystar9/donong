<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
<link rel= "stylesheet" type="text/css" href="./resources/css/admin.css">
<link rel= "stylesheet" type="text/css" href="./resources/css/member.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
 <script>
	 function check(){
		 if($.trim($("#id").val())==""){
				alert("아이디를 입력하세요");
				$("#id").val("").focus();
				return false;
		 }  
		 if($.trim($("#name").val())==""){
		 alert("실명을 쓰세요");
		 $("#name").val("").focus();
		 return false;
		 }
	}
 </script>

</head>
<body>
	<div id="pwd_wrap">
		<c:if test="${empty password}">
			<h2 class="pwd_title">비번 찾기</h2>
			<form method="post" action="find_password" onsubmit="return check()">
				<table id = "pwd_t">
					<tr>
						<th>아이디</th>
						<td><input name="id" id="id" size="14" class="input_box"></td>
					</tr>
					
					<tr>
						<th>회원이름</th>
						<td><input name="realname" id="name" size="14" class="input_box"></td>
					</tr>	
				</table>
				
				<div id="pwd_menu">
					<input type="submit" value="찾기" class="input_button">
					<input type="reset" value="취소" class="input_button" onclick="$('#id').focus();">
				</div>
				<div id = "pwd_close">
					<input type = "button" value="닫기" class="input_button" onclick="self.close()">
					<!--  close()메서드로 팝업창 닫기 -->
				</div>
			</form>
		</c:if>
		
		<c:if test="${!empty password }">
			<h2 class="pwd_title2">비번찾기 결과</h2>
			<table id = "pwd_t2">
				<tr>
					<th>검색한 비밀번호</th>
					<td>${password}</td>
				</tr>	
			</table>
			<div id="pwd_close2">
				<input type="button" value="닫기" class="input_button" onclick="self.close();">
			</div>
		</c:if>
		
	</div>

</body>
</html>