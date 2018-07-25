<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<div class="item-thumbnail" id="thumbnail${status.index+1}">
<img src="${item.filePath }" width=100px height= 100px alt="" />
<div class="form-group">
<p>${item.name }</p></div>
<div class="form-group">
<p>${item.price }원</p></div>
<div class="form-group row"><div class="col-sm-2">
<input class="form-control" width=30px type="number" name="quantity" id="quantity${status.index+1}" value="${item.quantity }" />
</div>개
</div>
<div class="form-group">
<input class="btn btn-default" type="button" value="수정하기" onclick="updateCartItem(${status.index+1}, ${item.cartNum})"/>
<input class="btn btn-default" type="button" value="삭제하기" onclick="deleteCartItem(${status.index+1}, ${item.cartNum})"/>
</div>
</div>