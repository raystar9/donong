<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>나만따라와 도시농부</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/resources/common/jsp/import.jsp" %>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 100%}
    
    /* Set gray background color and 100% height */
    .sidenav {
      height: 100%;
    }
    
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    
    #sample{
    	width:555px;
    	height:375px;
    }
    
    #sample1{
    	width:100%;
    	height:100%
    }

  </style>
</head>
<body>

  <%@include file="/WEB-INF/views/common/header.jsp" %>

<div class="container text-center">    
  <div class="row content">
    <div class="col-sm-6 text-center"> 
      <h1>이달의 작물(정보페이지)</h1>
      
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- 인디게이터(사진 아래 단추) -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    
    <!-- 슬라이드용 사진설정 -->
    <div class="carousel-inner">
      <div class="item active">
      	<a href="#1"><img id="sample" src="resources/main/image/sample1.png" alt="sample1" style="width:100%;"></a>
      	</div>
      	 <div class="item">
		<a href="#2"><img id="sample" src="resources/main/image/sample2.png" alt="sample2" style="width:100%;"></a>
		</div>
		 <div class="item">
		<a href="#3"><img id="sample" src="resources/main/image/logo.jpg" alt="logo" style="width:100%;"></a>
		</div>
      </div>
      
      <!-- 옆 슬라이드 이동 화살표 -->
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
      
      </div>
       
   </div>
     <div class="col-sm-6 text-center">
   	 <h1>분양정보 예정위치</h1>
     <p><a href="#"><img id="sample" src="resources/main/image/logo.jpg"></a></p> 
    </div>
    </div>
 </div>
    <div class="container text-center"> 
      <div class="row content">
      <h1>판매중인 상품(판매페이지)</h1>
   <div class="col-sm-2 text-center"> 
      <p><a href="#"><img id="sample1" src="resources/main/image/sample2.png"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="#"><img id="sample1" src="resources/main/image/sample2.png"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="#"><img id="sample1" src="resources/main/image/sample2.png"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="#"><img id="sample1" src="resources/main/image/sample2.png"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="#"><img id="sample1" src="resources/main/image/sample2.png"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="#"><img id="sample1" src="resources/main/image/sample2.png"></a></p>
    </div>
  </div>
  <div class="row content">
   <div class="col-sm-2 text-center"> 
      <p><a href="#"><img id="sample1" src="resources/main/image/sample2.png"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="#"><img id="sample1" src="resources/main/image/sample2.png"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="#"><img id="sample1" src="resources/main/image/sample2.png"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="#"><img id="sample1" src="resources/main/image/sample2.png"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="#"><img id="sample1" src="resources/main/image/sample2.png"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="#"><img id="sample1" src="resources/main/image/sample2.png"></a></p>
    </div>
  </div>
  </div>

</body>
</html>