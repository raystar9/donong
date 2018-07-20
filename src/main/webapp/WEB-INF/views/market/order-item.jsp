<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<div class="item-thumbnail">
<img src="${item.filePath }" width=100px height= 100px alt="" />
<p>${item.name }</p>
<p>${item.price }원</p>
<p>${item.quantity }개</p>
</div>