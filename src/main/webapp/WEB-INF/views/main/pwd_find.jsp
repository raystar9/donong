<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/donong/resources/bootstrap-3.3.2-dist/css/bootstrap.css">
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
			<form method="post" action="find_password" class="form-horizontal" onsubmit="return check()">
					<div class="form-group">
					<label class="control-label col-sm-2" for="id">ID</label>
						<div class="col-sm-9">
					<input class="form-control" name="id" id="id" placeholder="Enter Name">
					</div>
					</div>
						
					<div class="form-group">
   					 <label class="control-label col-sm-2" for="name">성명</label>
				<div class="col-sm-9"> 
     			 	<input class="form-control" name="realname" id="name" placeholder="Enter PhoneNumber">
  				</div>			
				</div>	
				
				<div class="form-group"> 
  					  <div class="col-sm-offset-2 col-sm-10">
     					 <button type="submit" class="btn btn-default">찾기</button>
     					 <button type = "button" class="btn btn-default" onclick="self.close()">취소</button>
   					 </div>
 				</div>		
			</form>
		</c:if>
		
		<c:if test="${!empty password }">
			<h2 class="col-sm-12 text-center">비밀번호찾기 결과</h2>
				<div class="form-group">
						<div class="col-sm-12 text-center">검색된 Password는 ${password} 입니다.</div>
				</div>
			
				<div class="form-group"> 
  					  <div class="col-sm-12 text-center">
     					<input type="button" value="닫기" class="btn btn-default" onclick="self.close();">
   					 </div>
 				</div>	
		</c:if>
		
	</div>

</body>
</html>