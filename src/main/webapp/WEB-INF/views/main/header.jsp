<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>


	<title>header</title>
	<link rel="stylesheet" type="text/css" href="/donong/resources/bootstrap-3.3.2-dist/css/bootstrap.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style>
li a:hover, .dropdown:hover {
    background-color: #9CCE5F;
}
.dropdown-toggle a{
	color:white;
}

.container-fluid{
background-color: #ACD17F;

}

#full{
	width:100%;
	height:100%;
}

img{
 width:50px;
  height:50px;
  margin:0 auto;
  padding:0;
}


</style>

	
</head>
<body>
<div id="full">

<div class="navbar navbar-default fixed-top">
<div class="container-fluid">
<div class="navbar-header">
<a href="member_login"><img src="resources/main/image/imsilogo.JPG"></a>
</div>
<ul class="nav navbar-nav">
   <li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">시작하기<span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#">사전준비</a></li>
      <li><a href="#">작물정보</a></li>
      <li><a href="#">재배방법</a></li>
     </ul>
  </li>
  
  
  <li class="dropdown">
   <a href="#" class="dropdown-toggle" data-toggle="dropdown">마을회관<span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#">주인장 비밀노트</a><li>
      <li><a href="#">공유정보</a></li>
      <li><a href="#">수확후기</a></li>
    </ul>
  </li>
  
    <li class="dropdown">
     <a href="#" class="dropdown-toggle" data-toggle="dropdown">준비하기(구매)<span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#">종자구매</a></li>
      <li><a href="#">비료구매</a></li>
      <li><a href="#">도구구매</a></li>
    </ul>
  </li>
  	
  	<li class="dropdown"><a href=#>농지대여</a></li>
  	
  	 <li class="dropdown">
     <a href="#" class="dropdown-toggle" data-toggle="dropdown">고객센터<span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#">FaQ</a></li>
      <li><a href="#">QnA</a></li>
      <li><a href="#">내가 한 질문</a></li>
    </ul>
  </li>
  
  
</ul>

 <ul class="nav navbar-nav navbar-right">
  <c:if test = '${sessionBean.nickname == null }'>
      <li><a href="member_login"><span class="glyphicon glyphicon-user"></span> Log in</a></li>
      <li><a href="member_join"><span class="glyphicon glyphicon-log-in"></span> Join</a></li>
  	</c:if>    
  	
	<c:if test = '${sessionBean.nickname != null }'>
		<li><a href="member_mypage">${sessionBean.nickname}님 마실나오셨네요</a></li>
		<li><a href="member_mypage"><span class="glyphicon glyphicon-pencil"></span> My Page</a></li>
		<li><a href="member_logout"><span class="glyphicon glyphicon-off"></span> Log out</a></li>
	</c:if> 
    </ul>
    
</div>
</div>
</div>
<h3>머리통</h3>


	
	
</body>
</html>


	