<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="/resources/common/jsp/import.jsp" %>
	<title>Home</title>
	<style>
		.left-navbar {
			width: 150px;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div>
	<div class="container">
		<h1>주문이 완료되었습니다.</h1>
		<h3>1002-000-000000 우리은행 홍길동</h3>
		<h3>으로 입금해주시기 바랍니다.</h3>
		<input class="btn btn-default" type="button" value="마켓 메인으로" onclick="location.href='/donong/market'"/>
	</div>
</div>
</body>
</html>
