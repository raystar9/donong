<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<div class="item-thumbnail">
<img src="${item.filePath }" width=100px height= 100px alt="" />
<p>${item.name }</p>
<p>${item.price }원</p>
<p>${item.quantity }개 
<input class="btn btn-default" type="button" value="수정하기" />
<input class="btn btn-default" type="button" value="삭제하기" onclick="confirm('정말로 삭제하시겠습니까?')"/></p>
</div>