<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<link rel= "stylesheet" type="text/css" href="./resources/css/admin.css">
<link rel= "stylesheet" type="text/css" href="./resources/css/member.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
 <script>
	 function check(){
		 if($.trim($("#realname").val())==""){
			 alert("실명을 입력하세요");
			 $("#realname").val("").focus();
			 return false;
			 }
		 if($.trim($("#phone").val())==""){
			alert("가입시 등록한 휴대폰번호를 입력하세요");
			$("#phone").val("").focus();
			return false;
		 }  
	
	}
 </script>

</head>
<body>
	<div id="id_wrap">
		<c:if test="${empty id}">
			<h2 class="id_title">아이디 찾기</h2>
			<form method="post" action="find_id" onsubmit="return check()">
				<table id = "id_t">
					<tr>
						<th>회원이름</th>
						<td><input name="realname" id="realname" size="14" class="input_box"></td>
					</tr>
					
					<tr>
						<th>휴대폰번호</th>
						<td><input name="phone" id="phone" size="14" class="input_box"></td>
					</tr>	
				</table>
				
				<div id="id_menu">
					<input type="submit" value="찾기" class="input_button">
					<input type="reset" value="취소" class="input_button" onclick="$('#realname').focus();">
				</div>
				<div id = "id_close">
					<input type = "button" value="닫기" class="input_button" onclick="self.close()">
					<!--  close()메서드로 팝업창 닫기 -->
				</div>
			</form>
		</c:if>
		
		<c:if test="${!empty id }">
			<h2 class="id_title2">아이디찾기 결과</h2>
			<table id = "id_t2">
				<tr>
					<th>검색된 ID</th>
					<td>${id}</td>
				</tr>	
			</table>
			<div id="id_close2">
				<input type="button" value="닫기" class="input_button" onclick="self.close();">
			</div>
		</c:if>
		
	</div>

</body>
</html>