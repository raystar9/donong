<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<div class="navbar">
<div class="navbar-header">
<a class="dropdown" href="/donong/main"><img id="logo" src="/donong/resources/main/image/logo.jpg"></a>
</div>
<div class="collapse navbar-collapse">
<ul class="nav navbar-nav">

   <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown">시작하기</a>
    <ul class="dropdown-menu">
      <li><a href="/donong/info">사전준비</a></li>
      <li><a href="#">작물정보</a></li>
      <li><a href="#">재배방법</a></li>
     </ul>
  </li>
  
  
  <li class="dropdown">
   <a class="dropdown-toggle" data-toggle="dropdown">마을회관</a>
    <ul class="dropdown-menu">
      <li><a href="/donong/communitylist">게시판</a><li>
      <li><a href="#">공유정보</a></li>
      <li><a href="#">수확후기</a></li>
    </ul>
  </li>
  
    <li class="dropdown">
     <a class="dropdown-toggle" data-toggle="dropdown">준비하기(구매)</a>
    <ul class="dropdown-menu">
      <li><a href="/donong/market?category=seed">종자</a></li>
      <li><a href="/donong/market?category=fertilizer">비료</a></li>
      <li><a href="/donong/market?category=tools">도구</a></li>
    </ul>
  </li>
  	
  	<li class="dropdown"><a href='/donong/rental'>농지대여</a></li>
  	
  	 <li class="dropdown">
     <a class="dropdown-toggle" data-toggle="dropdown">고객센터</a>
    <ul class="dropdown-menu">
      <li><a href="/donong/cs/main">메인</a></li>
      <li><a href="/donong/cs/qna">QnA</a></li>
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
          
          
          <h4 class="modal-title">Login Page</h4>
        </div>
	<form class="form-horizontal" method="post" action="member_login_ok" onsubmit="return check()">
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


	