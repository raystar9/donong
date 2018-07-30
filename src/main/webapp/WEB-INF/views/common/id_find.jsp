<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
 <%@ include file="/resources/common/jsp/import.jsp" %>

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
 <style>
		 
 </style>

</head>
<body>
	<div id="container text-center">
		<c:if test="${empty id}">
			<h2 class="id_title">아이디 찾기</h2>
			<form method="post" action="find_id" class="form-horizontal" onsubmit="return check()">
				<div class="form-group">
					
					<label class="control-label col-sm-2" for="realname">성명</label>
						<div class="col-sm-9">
					<input class="form-control" name="realname" id="realname" placeholder="Enter Name">
				</div>
				</div>
			
				 <div class="form-group">
   					 <label class="control-label col-sm-2" for="phone">휴대폰번호</label>
				<div class="col-sm-9"> 
     			 	<input class="form-control" name="phone" id="phone" placeholder="Enter PhoneNumber">
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

		<c:if test="${!empty id }">
			<h2 class="col-sm-12 text-center">아이디찾기 결과</h2>
				<div class="form-group">
						<div class="col-sm-12 text-center">검색된 ID는 ${id} 입니다.</div>
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