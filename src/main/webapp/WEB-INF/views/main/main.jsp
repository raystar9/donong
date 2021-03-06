<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>나만따라와 도시농부</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/resources/common/jsp/import.jsp" %>
<script src="/donong/resources/main/js/main.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHdzdDM31uM0W0KvSAVn1awYGp0ujKE_g&callback=initMap&libraries=places"></script>

  <!-- google font 링크 -->
  <style>
  	body {
  		margin-bottom:20px;
  	}
  	.main {
  		font-family: 'Gamja Flower', cursive;
  	}
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
    	width:180px;
    	height:135px;
    }
    .footer-bg{
    padding-right:0px;
    padding-left:0px;
    }
  
 	/* 
     .carousel-indicators .active{
    	background-color:red;
    	
    }  이미지 슬라이드 버튼 활성화 시 색 설정 없을 경우 white */ 
     /* 
     
    .carousel-indicators li{
    	background-color:black;
    	 이미지 슬라이드 버튼 비활성화 시 색 설정 없을 경우 반투명 
    }  */

    
    #map{
		width:555px;
		height:375px;
    }
    
    #footani{
   		 width:180px;
    	height:120px;
    }
    #bg{
        background-image: url("resources/main/image/backg.png"); 
        width:100%;
        margin-bottom:5px;
    }
    
    #anibar {
  animation-duration: 90s;
  animation-name: slidein;
  animation-iteration-count: infinite; 	
  font-size:25px;
}

@keyframes slidein {
  from {
    margin-left: 100%;
    width: 80%;
  }

  to {
    margin-left: -20%;
    width: 80%;
  }
}

.carousel-caption{
	font-size:20px;
}
  
  </style>
</head>
<body>

  <%@include file="/WEB-INF/views/common/header.jsp" %>
<div class="main">
<div class="container text-center">    
  <div class="row content">
    <div class="col-sm-6 text-center"> 
      <h1>이달의 작물</h1>
      
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
      	<a href="/donong/info_start_1"><img id="sample" src="resources/main/image/main_start.png" alt="sample1" style="width:100%;"></a>
      	    <div class="carousel-caption">
        		애호박도 떡잎부터
        	</div>
      	</div>
      	 <div class="item">
		<a href="/donong/info_farming_7"><img id="sample" src="resources/main/image/main_ready.jpg" alt="main_ready" style="width:100%;"></a>
			<div class="carousel-caption">
	        		8월의 추천 작물 배추<br>
	        		김장철에 수확할 수 있는 최적화된 시기 
	        	</div>
		</div>
		 <div class="item">
		<a href="/donong/community/list"><img id="sample" src="resources/main/image/main_community.jpg" alt="main_community" style="width:100%;"></a>
			  <div class="carousel-caption">
        		max님의 베스트 샷<br>
        		벌써부터 자세가 남다릅니다
        	</div>
	
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
       
       <!-- 분양정보 위치 지도 들어 가야 하는 곳 -->
   </div>
     <div class="col-sm-6 text-center">
      <h1>농지 대여 정보 </h1>
      <div id="map"></div>
    </div>
    </div>
 </div>
 
 
 <div class="container">
 <h1>판매중인 상품</h1>
 
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">종자</a></li>
    <li><a data-toggle="tab" href="#menu1">비료</a></li>
    <li><a data-toggle="tab" href="#menu2">도구</a></li>
  </ul>


  <div class="tab-content">
  <div id="home" class="tab-pane fade in active">
    <div class="row content">
      
    <!-- 종자 사진 보여주는 곳 -->
   <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/25"><img id="sample1" src="resources/main/image/market/seed/s1.jpg"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/26"><img id="sample1" src="resources/main/image/market/seed/s2.jpg"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/27"><img id="sample1" src="resources/main/image/market/seed/s3.jpg"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/28"><img id="sample1" src="resources/main/image/market/seed/s4.jpg"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/29"><img id="sample1" src="resources/main/image/market/seed/s5.jpg"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/30"><img id="sample1" src="resources/main/image/market/seed/s6.jpg"></a></p>
    </div>
    </div> <!-- end row content -->
    
  <div class="row content">
   <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/31"><img id="sample1" src="resources/main/image/market/seed/s7.jpg"></a></p>
    </div>
     <div class="col-sm-2 text-center"> 
		<p><a href="/donong/market/item/32"><img id="sample1" src="resources/main/image/market/seed/s8.jpg"></a></p>    
	</div>
     <div class="col-sm-2 text-center"> 
		<p><a href="/donong/market/item/33"><img id="sample1" src="resources/main/image/market/seed/s9.jpg"></a></p>    
	</div>
     <div class="col-sm-2 text-center"> 
		<p><a href="/donong/market/item/34"><img id="sample1" src="resources/main/image/market/seed/s10.jpg"></a></p>    
	</div>
     <div class="col-sm-2 text-center"> 
		<p><a href="/donong/market/item/35"><img id="sample1" src="resources/main/image/market/seed/s11.jpg"></a></p>    
	</div>
     <div class="col-sm-2 text-center"> 
		<p><a href="/donong/market/item/36"><img id="sample1" src="resources/main/image/market/seed/s12.jpg"></a></p>   
 	</div>
    </div> <!-- end row content -->
      
      
    </div>
    <div id="menu1" class="tab-pane fade">

      <div class="row content">
      
    <!-- 비료 사진 보여주는 곳 -->
   <div class="col-sm-2 text-center"> 
		<p><a href="/donong/market/item/4"><img id="sample1" src="resources/main/image/market/fertilizer/f1.jpg"></a></p> 
 	</div>
     <div class="col-sm-2 text-center"> 
     <p><a href="/donong/market/item/5"><img id="sample1" src="resources/main/image/market/fertilizer/f2.jpg"></a></p> 
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/6"><img id="sample1" src="resources/main/image/market/fertilizer/f3.jpg"></a></p> 
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/7"><img id="sample1" src="resources/main/image/market/fertilizer/f4.jpg"></a></p> 
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/8"><img id="sample1" src="resources/main/image/market/fertilizer/f5.jpg"></a></p> 
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/9"><img id="sample1" src="resources/main/image/market/fertilizer/f6.jpg"></a></p> 
    </div>
   </div> <!-- end row content -->
   
  <div class="row content">
   <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/10"><img id="sample1" src="resources/main/image/market/fertilizer/f7.jpg"></a></p> 
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/11"><img id="sample1" src="resources/main/image/market/fertilizer/f8.jpg"></a></p> 
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/12"><img id="sample1" src="resources/main/image/market/fertilizer/f9.jpg"></a></p> 
    </div>
     <div class="col-sm-2 text-center"> 
     <p><a href="/donong/market/item/13"><img id="sample1" src="resources/main/image/market/fertilizer/f10.jpg"></a></p> 
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/14"><img id="sample1" src="resources/main/image/market/fertilizer/f11.jpg"></a></p> 
    </div>
     <div class="col-sm-2 text-center"> 
     <p><a href="/donong/market/item/15"><img id="sample1" src="resources/main/image/market/fertilizer/f12.jpg"></a></p> 
    </div>
  </div> <!-- end row content -->
      
    </div>
    <div id="menu2" class="tab-pane fade">
      <div class="row content">
      
    <!-- 도구 사진 보여주는 곳 -->
   <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/50"><img id="sample1" src="resources/main/image/market/toos/t1.jpg"></a></p>  
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/51"><img id="sample1" src="resources/main/image/market/toos/t2.jpg"></a></p>  
    </div>
     <div class="col-sm-2 text-center"> 
     <p><a href="/donong/market/item/52"><img id="sample1" src="resources/main/image/market/toos/t3.jpg"></a></p>  
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/53"><img id="sample1" src="resources/main/image/market/toos/t12.jpg"></a></p>  
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/54"><img id="sample1" src="resources/main/image/market/toos/t13.jpg"></a></p>  
    </div>
     <div class="col-sm-2 text-center"> 
     <p><a href="/donong/market/item/56"><img id="sample1" src="resources/main/image/market/toos/t15.jpg"></a></p>  
    </div>
    </div> <!-- end row content -->
  
  <div class="row content">
   <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/57"><img id="sample1" src="resources/main/image/market/toos/t16.jpg"></a></p>  
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/58"><img id="sample1" src="resources/main/image/market/toos/t17.jpg"></a></p>  
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/60"><img id="sample1" src="resources/main/image/market/toos/t19.jpg"></a></p>  
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/63"><img id="sample1" src="resources/main/image/market/toos/t22.jpg"></a></p>  
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/64"><img id="sample1" src="resources/main/image/market/toos/t23.jpg"></a></p>  
    </div>
     <div class="col-sm-2 text-center"> 
      <p><a href="/donong/market/item/66"><img id="sample1" src="resources/main/image/market/toos/t30.jpg"></a></p>  
    </div> 
  </div> <!-- end row content -->
    </div> <!-- end menu2 tab-pane -->
 
  </div>
</div>

 <footer class="container-fluid navbar-fixed-bottom footer-bg">
 <div id="bg">
     <div id="anibar"><a href="member_join"><img id="footani" src="resources/main/image/aniu1.gif">도시 속 힐링 도시농부</a></div>
 </div>    
 </footer>
</div>
</body>
</html>