<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<div class="item-thumbnail">
<div class="col-sm-2">
	<img src="${item.filePath }" alt="#" width="160px" height="160px"/>
</div>
<div class="col-sm-6">
	<a href="/donong/market/item/${item.num}">${item.num}번째 아이템</a>
</div>
<div class="col-sm-4">
	가격들어갈자리
</div>
</div>