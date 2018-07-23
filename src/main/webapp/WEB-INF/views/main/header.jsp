<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>


	<title>header</title>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/donong/resources/bootstrap-3.3.2-dist/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style>
 


.container-fluid{
background-color: #ACD17F;

}

.dropdown{
	width:200px;
	font-size:15pt;
	font-weight:bold;
	text-align:center;
}

#full{
	width:100%;
	height:100%;
}

#logo{
 width:55.56px;
  height:55.56px;
  margin:0 auto;
  padding:0;
}
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
    width:200px;
    font-size:15pt;
	font-weight:bold;
	text-align:center;
	background-color: #ACD17F;
	color:white;
}


.navbar-nav {

  display: inline-block;

  float: none;

}

.navbar-collapse {

  text-align: center;

}

.nav > li > a:hover,
.nav > li > a:focus {
  text-decoration: none;
   background-color:#9CCE5F;
  color:white;
}

.nav > li > a,
.nav > li > a {
  text-decoration: none;
   background-color:#ACD17F;
  color:white;
}

.dropdown-menu > li > a:hover,
.dropdown-menu > li > a:focus {
  text-decoration: none;
   background-color:#9CCE5F;
  color:white;
}

.dropdown-menu > li > a,
.dropdown-menu > li > a {
  text-decoration: none;
   background-color:#ACD17F;
  color:white;
}

</style>

	
</head>
<body>
<div id="full">

<div class="container-fluid">
<div class="navbar-header">
<a class="dropdown" href="main"><img id="logo" src="resources/main/image/imsilogo.JPG"></a>
</div>
<div class="collapse navbar-collapse">
<ul class="nav navbar-nav">

   <li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">시작하기</a>
    <ul class="dropdown-menu">
      <li><a href="#">사전준비</a></li>
      <li><a href="#">작물정보</a></li>
      <li><a href="#">재배방법</a></li>
     </ul>
  </li>
  
  
  <li class="dropdown">
   <a href="#" class="dropdown-toggle" data-toggle="dropdown">마을회관</a>
    <ul class="dropdown-menu">
      <li><a href="#">공지사항</a><li>
      <li><a href="#">공유정보</a></li>
      <li><a href="#">수확후기</a></li>
    </ul>
  </li>
  
    <li class="dropdown">
     <a href="#" class="dropdown-toggle" data-toggle="dropdown">준비하기(구매)</a>
    <ul class="dropdown-menu">
      <li><a href="#">종자구매</a></li>
      <li><a href="#">비료구매</a></li>
      <li><a href="#">도구구매</a></li>
    </ul>
  </li>
  	
  	<li class="dropdown"><a href=#>농지대여</a></li>
  	
  	 <li class="dropdown">
     <a href="#" class="dropdown-toggle" data-toggle="dropdown">고객센터</a>
    <ul class="dropdown-menu">
      <li><a href="#">FaQ</a></li>
      <li><a href="#">QnA</a></li>
      <li><a href="#">내가 한 질문</a></li>
    </ul>
  </li>
  
  
</ul>

 <ul class="nav navbar-nav navbar-right">
  <c:if test = '${sessionBean.nickname == null }'>
      <li><a href="#myModal" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span> Log in</a></li>
      <li><a href="member_join"><span class="glyphicon glyphicon-log-in"></span> Join</a></li>
  	</c:if>    
  	
	<c:if test = '${sessionBean.nickname != null }'>
		<li><a href="member_mypage">${sessionBean.nickname}님 마실나오셨네요</a></li>
		<li><a href="member_mypage"><span class="glyphicon glyphicon-pencil"></span> My Page</a></li>
		<li><a href="member_logout"><span class="glyphicon glyphicon-off"></span> Log out</a></li>
	</c:if> 
    </ul>
    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</div>
</div>
</div>



	
	
</body>
</html>


	