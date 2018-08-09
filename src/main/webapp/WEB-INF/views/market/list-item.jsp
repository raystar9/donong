<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<div class="row panel panel-default">
<div class="item-cell">
	<img class="img-thumbnail item-img" src="${item.filePath }" alt="#" width="160px" height="160px"/>
</div>
	<div class="item-name item-cell">
		<a href="/donong/market/item/${item.num}">${item.title}</a>
	</div>
	<div class="item-price item-cell">
		<fmt:formatNumber pattern="#,###">${item.price }</fmt:formatNumber>원
	</div>
</div>