<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<div class="item-thumbnail" id="thumbnail${status.index+1}">
<img src="${item.filePath }" width=100px height= 100px alt="" />
<div class="cart-body col-sm-4">
<div class="form-group">
<h4>${item.name }</h4></div>
<div class="form-group">
<p>${item.price }원</p></div>
</div>
<div class="cart-button">
<div class="form-group row pull-right">
<div class="col-sm-8">
<input class="form-control" width=30px type="number" name="quantity" id="quantity${status.index+1}" value="${item.quantity }" /></div>
<div class="col-sm-4">
<label for="quantity" class="control-label col-sm-1">개</label>
</div>
</div>
<div class="row">
<div class="col-sm-6">
<input class="btn btn-default form-control" type="button" value="수정하기" onclick="updateCartItem(${status.index+1}, ${item.cartNum})"/>
</div>
<div class="col-sm-6">
<input class="btn btn-default form-control" type="button" value="삭제하기" onclick="deleteCartItem(${status.index+1}, ${item.cartNum})"/>
</div>

</div>
</div>
</div>