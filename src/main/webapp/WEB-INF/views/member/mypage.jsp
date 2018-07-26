<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
  <title>My Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/resources/common/jsp/import.jsp" %>
  
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
 
    
    /* Set black background color, white text and some padding */
    footer {
      background-color:  #ACD17F;
      color: white;
      padding: 15px;
     	text-align:center;
     	height:60px;
    }
      .row.content {height: auto;} 

	.mypage-buy{
		
		margin-top:50px;
	}
	

	.mypage-write{
		margin-top:100px;
		margin-bottom:50px;
	}
	
	

  </style>
</head>
<body>
  <%@include file="../common/header.jsp" %>
  
  <div class="container mypage-buy">
  <div class="row">
  <div class="col-sm-12 text-center">
  <h2>구매 내역</h2>
  <p>${sessionBean.nickname}님의 구매내역 입니다.</p>  
  </div>
  </div>
<div class="row">  
  <div class="col-sm-2"></div>
    <div class="col-sm-8">          
  <table class="table table-hover">
    <thead>
      <tr>
        <th>상품명</th>
        <th>배송상태</th>
        <th>구매일</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>모종삽</td>
        <td>준비중</td>
        <td>1번날짜</td>
      </tr>
      <tr>
     	<td>고추씨</td>
        <td>배송중</td>
        <td>2번날짜</td>
      </tr>
      <tr>
      	<td>화분</td>
        <td>배송완료</td>
        <td>3번날짜</td>
      </tr>
    </tbody>
  </table>
  </div>
    <div class="col-sm-2"></div>
</div>
  </div>
<div class="container mypage-write">
 <div class="col-sm-12 text-center">
	<h2>최근에 작성한 글</h2>
</div>
	<div class="col-sm-2"></div>
    <div class="col-sm-8">

	
	
      
      <ul class="nav nav-pills nav-stacked">
        <li><a href="#1">작성글1</a></li>
        <li><a href="#2">작성글2</a></li>
        <li><a href="#3">작성글3</a></li>
        <li><a href="#4">작성글4</a></li>
        <li><a href="#5">작성글5</a></li>
      </ul><br>
   
    </div>
  
    <div class="col-sm-2"></div>
	</div>


<footer class="container-footer">
	<div class="col-sm-3"></div>
		
		<div class="col-sm-6">
		<input type="button" value="정보수정"  class="btn btn-default" onclick="location='member_edit'">
		<input type="button" value="내가 한 질문"  class="btn btn-default" onclick="location='member_del'">
		<input type="button" value="회원탈퇴"  class="btn btn-default" onclick="location='member_del'">
	
		</div>
	<div class="col-sm-3"></div>
</footer>

</body>
</html>
