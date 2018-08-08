<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<style>
	#logo{
		width:120px;
		height:80px;
		margin-left:20px;
		margin-top:5px;
	}
</style>
<div id="main-navbar" class="navbar main-navbar">
<div class="container-fluid">
<div class="navbar-header">
<a class="dropdown" href="/donong/main"><img id="logo" src="/donong/resources/main/image/logo2.png"></a>
</div>
<ul class="nav navbar-nav">

   <li class="dropdown main-menu">
    <a class="dropdown-toggle">시작하기</a>
    <ul class="dropdown-menu">
      <li><a href="/donong/info">농사계획</a></li>
      <li><a href="/donong/info_start_2">텃밭유형</a></li>
      <li><a href="/donong/info_start_3">재배작물 선택</a></li>
      <li><a href="/donong/info_start_4">작물배치도</a></li>
      <li><a href="/donong/info_start_5">허브작물 재배</a></li>
     </ul>
  </li>
  
     <li class="dropdown main-menu">
    <a class="dropdown-toggle">농사짓기</a>
    <ul class="dropdown-menu">
      <li><a href="/donong/info_farming_1">밭만들기</a></li>
      <li><a href="/donong/info_farming_2">파종과 육묘,정식</a></li>
      <li><a href="/donong/info_farming_3">작물돌보기</a></li>
      <li><a href="/donong/info_farming_4">비료와 농약</a></li>
      <li><a href="/donong/info_farming_5">태풍과 장마</a></li>
      <li><a href="/donong/info_farming_6">수확하기</a></li>
      <li><a href="/donong/info_farming_7">농사달력</a></li>
      <li><a href="/donong/info_farming_8">병해충 정보</a></li>
     </ul>
  </li>
  
  
  <li class="dropdown main-menu">
   <a class="dropdown-toggle" href="/donong/community/list">마을회관</a>
  </li>
  
    <li class="dropdown main-menu">
     <a class="dropdown-toggle">자재구매</a>
    <ul class="dropdown-menu">
      <li><a href="/donong/market?category=seed">종자</a></li>
      <li><a href="/donong/market?category=fertilizer">비료</a></li>
      <li><a href="/donong/market?category=tools">도구</a></li>
    </ul>
  </li>
  	
  	<li class="dropdown main-menu"><a href='/donong/rental'>농지대여</a></li>
  	
  	 <li class="dropdown main-menu">
     <a class="dropdown-toggle" href="/donong/cs">고객센터</a>
  </li>
  
  
</ul>

 <ul class="nav navbar-nav navbar-right">

  <c:if test = '${sessionBean.nickname == null }'>
      <li><a href="#myModal" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span> Log in</a></li>
      <li><a href="/donong/member_join"><span class="glyphicon glyphicon-log-in"></span> Join</a></li>
  	</c:if>    
  	
	<c:if test = '${sessionBean.nickname != null }'>
			<c:if test = '${sessionBean.nickname == "admin"}'>
				<li><a href="/donong/admin/market">관리자 모드로 접속하였습니다.</a></li>
				<li><a href="/donong/admin/market"><span class="glyphicon glyphicon-pencil"></span> 관리자 Page</a></li>		
			</c:if>
			<c:if test = '${sessionBean.nickname != "admin"}'>
				<li><a href="/donong/member_mypage">${sessionBean.nickname}님 마실나오셨네요</a></li>
				<li><a href="/donong/member_mypage"><span class="glyphicon glyphicon-pencil"></span> My Page</a></li>
			</c:if>
			
		<li><a href="/donong/member_logout"><span class="glyphicon glyphicon-off"></span> Log out</a></li>
	</c:if> 
    </ul>
    
    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
          
          <h4 class="modal-title">Login Page</h4>
        </div>
	<form class="form-horizontal" method="post" action="/donong/member_login_ok" onsubmit="return check()">
        <div class="modal-body">
				<div class="form-group">
						<label class="control-label col-sm-2" for="id">아이디</label>
						<div class="col-sm-10">
							<input name="id" id="id" size="20" class="form-control" placeholder="Enter ID"
							<c:if test="${!empty saveid}"> value="${saveid}" </c:if>>
						</div>
				</div>		
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">비밀번호</label>
						<div class="col-sm-10">
						<input type="password" name="password" id="pwd" size="20" class="form-control" placeholder="Enter PassWord">
						</div>
					</div>
					
					<div class="form-group"> 
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox text-left">
	       						 <label><input type="checkbox" name="saveid" id="saveid"  
									<c:if test="${!empty saveid}">checked</c:if>> Remember ID</label>
     						</div>
     						<div class="find text-right">
     						<div><a onclick="id_find()">ID찾기</a>/<a onclick="pwd_find()">비밀번호찾기</a></div>
  							</div>
     					</div>	
     				</div>	 

        </div> <!-- end modal-body -->
        
        <div class="modal-footer">
       		 <input type="submit" value="로그인" class="btn btn-default">      
       		 <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
        </form>
      </div> <!-- end modal-content -->
      
    </div> <!-- end modal-dialog -->
  </div> <!-- end modal fade -->
</div> <!-- end navbar-collapse -->
</div>


	