<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="/resources/common/jsp/import.jsp" %>
	<title>Home</title>
	<style>
		.main {
			display: flex;
		}
		.sidenav {
			margin-left: -15px;
		    height: auto; /* Full-height: remove this if you want "auto" height */
		    width: 160px; /* Set the width of the sidebar */
		    border-right: 1px #ddd solid;
		    border-bottom: 1px #ddd solid;
		    overflow-x: hidden; /* Disable horizontal scroll */
		    padding-top: 20px;
		}
		.sidenav a {
		    padding: 6px 8px 6px 16px;
		    text-decoration: none;
		    font-size: 25px;
		    color: #818181;
		    display: block;
		}
		.item-img {
			margin-left: 5px;
			margin-top: 3px;
			margin-bottom: 3px;
			height: 167px;
		}
		.item-container {
			margin-left: 20px;
		}
		.item-cell {
			display: inline-block;
		}
		.item-name {
			width: 500px;
		}
		.item-price {
			width: 400px;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="main container-fluid">	
	<div class="sidenav">
		<a href="/donong/market?category=seed">모종 씨앗</a>
		<a href="/donong/market?category=fertilizer">비료</a>
		<a href="/donong/market?category=tools">도구</a>
	</div>
	<div class="item-container">
	<div>
		<h1>Donong 자재구매</h1>
	</div>
	<div class="container-fluid">
		<c:forEach items="${items}" var="item">
			<%@ include file="/WEB-INF/views/market/list-item.jsp" %>
		</c:forEach>
	</div>
	<ul class="pagination">
		<c:forEach begin="${page.start}" end="${page.end}" varStatus="status">
			<c:choose>
				<c:when test="${page.current == status.index }">
					<li class="active"><a href="#">${status.index}</a></li>
				</c:when>
			
				<c:otherwise>
				<li><a href="/donong/market?category=${page.category}&page=${status.index}">${status.index}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
	</div>
</div>
</body>
</html>
