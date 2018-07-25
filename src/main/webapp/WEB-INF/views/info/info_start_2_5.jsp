<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>
	<div class="container">
		<h2 class="comcont_title" style="witdh: 370px">정보게시판</h2>
		<div id="boardcont_menu">
			<div class="btn-group">
				<ul class="nav nav-tabs">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="info_start_1">시작하기 <span
							class="caret"></span></a>

						<ul class="dropdown-menu" role="menu">
							<li><a href="info_start_1">농사계획</a></li>
							<li><a href="info_start_2">텃밭유형</a></li>
							<li><a href="info_start_3">재배작물 선택하기</a></li>
							<li><a href="info_start_4">작물배치도 만들기</a></li>
							<li><a href="info_start_5">허브작물 재배하기</a></li>
						</ul>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="info_farming_1">농사짓기 <span
							class="caret"></span></a>

						<ul class="dropdown-menu" role="menu">
							<li><a href="info_farming_1">밭 만들기</a></li>
							<li><a href="info_farming_2">파종과 육모, 정식</a></li>
							<li><a href="info_farming_3">작물 돌보기</a></li>
							<li><a href="info_farming_4">비료와 농약</a></li>
							<li><a href="info_farming_5">태풍과 장마</a></li>
							<li><a href="info_farming_6">수확하기</a></li>
							<li><a href="info_farming_7">농사달력</a></li>
							<li><a href="info_farming_8">병해충 정보</a></li>

						</ul>
				</ul>
			</div>
		</div>
		<h3>텃밭유형</h3>
		<h4>다양한 텃밭의 유형에 관한 정보를 알려드립니다.</h4>
		<hr>
		<ul class="nav nav-tabs">
			<li><a href="info_start_2">자투리텃밭</a></li>
			<li><a href="info_start_2_2">주말농장</a></li>
			<li><a href="info_start_2_3">옥상정원</a></li>
			<li><a href="info_start_2_4">스쿨팜</a></li>
			<li class="active"><a href="info_start_2_5">베란다 텃밭</a></li>
		</ul>
		<hr>
		<div class="bbs_view_cont bbs_view_cont_1">
			<p align="center" style="text-align: center;">
				<img
					src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/017DB2DA-A6E4-0428-D0BC-36A9A59C05F6.jpg">&nbsp;
			</p>
			<p align="center" style="text-align: center;">
				<span style="color: rgb(1, 143, 255); font-size: 24pt;"><strong><span
						style='color: rgb(37, 37, 37); font-family: "나눔명조", NanumMyeongjo, serif;'>베란다
							농업</span></strong></span>
			</p>
			<p align="center" style="text-align: center;">
				<strong><span style="font-size: 11pt;"></span></strong>&nbsp;
			</p>
			<p align="center" style="text-align: center;">
				<strong><span style="font-size: 12pt;">키우는 기쁨과 수확하는
						보람, 자녀들의 체험학습을 위해 채소를 직접 기르고자 하는 가정이 늘고 있다.</span></strong>
			</p>
			<p align="center" style="text-align: center;">
				<strong><span style="font-size: 11pt;"></span></strong>&nbsp;
			</p>
			<p align="left" style="text-align: left;">
				<span style="font-size: 11pt;">더욱이, 가속화된 이상기후의 영향으로 채소 가격 변동이
					심해 가정 채소재배에 대한 관심은 더욱 높아졌다. 하지만, 도시 빽빽한 빌딩과 아파트 숲속에선 텃밭을 가꾸고 싶어도
					여건상 어려운 경우가 많다. 특히 아파트가 대표적인 주거공간으로 자리 잡아 마당이 있는 주택보다 아파트에 사는 인구가
					훨씬 많다. 현재까지 실내에서 많이 키우던 식물은 주로 관엽식물이었는데, 채소 기르기에 도전해 보는 것은 색다른 즐거움을
					안겨줄 것이다. 실내는 접근이 쉽고, 부담 없이 시작할 수 있어 좋고 가장 가까이에 채소정원으로 만들 수 있어 좋다.
					우리의 일상공간에 도시농업을 들여옴으로써 지속적인 관리가 가능하고 수확해서 즉시 이용이 가능해서 천연 냉장고 역할을 할
					것이다.</span><span style="font-size: 11pt;"></span>&nbsp;
			</p>
			<p align="center" style="text-align: center;">&nbsp;</p>

		</div>

		<div id="boardcont_menu" style="float:right;">

			<input type="button" value="목록" class="btn" onclick="location='info'">
		</div>
	</div>
</body>
</html>