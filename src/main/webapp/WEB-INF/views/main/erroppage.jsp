<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script>
			
	</script> 

	<title>로그인 에러 페이지</title>
	
</head>
<body>
<c:if test="${error=='loginfail'}">
	<script>
		alert("로그인 정보를 다시 확인해 주세요.");
		history.back();
	</script>
</c:if>

<c:if test="${error=='logout'}">
	<script>
		alert("로그아웃 되었습니다.");
		location.href="member_login"
	</script>	
</c:if>

<c:if test="${error=='findpassfail'}">
	<script>
		alert("입력 정보를 다시 확인해주세요");
		history.back();
	</script>	
</c:if>

<c:if test="${error=='findidfail'}">
	<script>
		alert("입력 정보를 다시 확인해주세요");
		history.back();
	</script>	
</c:if>


</body>
</html>