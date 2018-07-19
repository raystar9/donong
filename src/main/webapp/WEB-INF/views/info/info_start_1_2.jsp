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
		<h3>농사 계획</h3>
		<h4>텃밭 농사를 시작하기 위해 필요한 것들을 알아봅니다.</h4>
		<hr>
		<ul class="nav nav-tabs">
			<li><a href="info_start_1">사전준비하기</a></li>
			<li class="active"><a href="info_start_1_2">텃밭유형 정하기</a></li>
			<li><a href="info_start_1_3">농사계획 세우기</a></li>
			<li><a href="info_start_1_4">농사짓기</a></li>
		</ul>
		<hr>
		<div class="bbs_view_cont bbs_view_cont_1">
			<p align="center">
				<img
					src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/E7F544D4-EC34-18F1-20C4-3975C3243920.jpg">&nbsp;
			</p>
			<p align="center" style="text-align: center;">
				<span style="font-size: 24pt;"><strong><span
						style="color: rgb(37, 37, 37); font-family:"
						나눔명조",nanummyeongjo,serif;"="">텃밭유형 정하기</span></strong></span>
			</p>
			<p align="center" style="text-align: center;">
				<span style="font-size: 11pt;"><strong><br></strong></span>
			</p>
			<p align="center" style="text-align: center;">
				<span style="font-size: 11pt;"><strong><span
						style="font-size: 12pt;">도시에서 농사를 시작한다면 몇 가지 방법이 있습니다. 우선은
							많은 사람이 알고 있는 주말농장이 있고, 텃밭을 이용하는 방법이 있고, 주거지의 옥상이나 마당, 아파트 베란다나
							테라스 등이 있습니다. 각자의 환경과 조건에 맞추어 토지를 준비해 봅니다.</span></strong></span>
			</p>
			<p align="center" style="text-align: center;">
				<span style="font-size: 11pt;"><strong><br></strong></span>
			</p>
			<p>
				<strong><br></strong>
			</p>
			<p align="center" style="text-align: center;">
				<strong><img
					src="resources/images/info_start_1_2 (1).jpg"></strong><img
					src="resources/images/info_start_1_2 (2).jpg"><img
					src="resources/images/info_start_1_2 (3).jpg">
			</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p align="center" style="text-align: center;">
				<img
					src="resources/images/info_start_1_2 (4).jpg"><img
					src="resources/images/info_start_1_2 (5).jpg"><br>
				<span style="font-size: 11pt;"><strong><br></strong></span>
			</p>
			<p>&nbsp;</p>
			<p align="center">
				<img
					src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/E7F544D4-EC34-18F1-20C4-3975C3243920.jpg">&nbsp;
			</p>
			<p align="center" style="text-align: center;">
				<span style="font-size: 24pt;"><span
					style="color: rgb(37, 37, 37); font-family:"
					나눔명조",nanummyeongjo,serif;"="">실외 텃밭</span></span>
			</p>
			<p align="left" style="text-align: left;">
				<span style="font-size: 11pt;"></span>&nbsp;
			</p>
			<p align="left" style="text-align: left;">
				<span style="font-size: 11pt;">텃밭이란 개인 밭이거나 제한 없이 자유롭게 농사짓는
					것이 가능한 밭을 말합니다. 전업농의 밭 한쪽을 얻는 경우도 있고 과수원의 한 귀퉁이나 마당까지도 다 해당됩니다. 텃밭이
					주말농장과 크게 다른 것은 다음 해까지도 내 밭 이랑이 유지되고 농사 시작도 내 맘대로 할 수 있다는 것입니다. 그래서
					주말농장을 하던 사람들이 농사에 재미가 붙으면 텃밭으로 옮겨갑니다. 텃밭에서는 다양한 일을 해볼 수 있습니다. 다년생
					작물 재배가 가능하고 흙을 개량하는 작업을 할 수가 있습니다. 또 긴 시간에 걸쳐 밭을 만들어가는 즐거움을 경험할 수
					있습니다.</span>&nbsp;
			</p>
			<p align="left" style="text-align: left;">&nbsp;</p>
			<p align="center" style="text-align: center;">
				<br>
			</p>
			<div align="right" style="text-align: right;"></div>
			<p style="text-align: center;">
				<span style="font-size: 11pt;"><strong><br></strong></span>
			</p>
			<p align="center" style="text-align: center;">
				<span style="font-size: 11pt;"><strong><br></strong></span>
			</p>
			<span style="font-size: 11pt;"><p align="center">
					<img
						src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/E7F544D4-EC34-18F1-20C4-3975C3243920.jpg">&nbsp;
				</p>
				<p align="center" style="text-align: center;">
					<span style="font-size: 24pt;"><span
						style="color: rgb(255, 0, 84);"><span
							style="color: rgb(37, 37, 37); font-family:"
							나눔명조",nanummyeongjo,serif;"="">주말농장 텃밭</span></span></span>
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;"></span>&nbsp;
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;">넓은 밭을 이랑 별로 쪼개서 1년 단위로 임대해주는
						방식으로 운영됩니다. 빈 땅이 부족한 도심에서 안정적이면서도 합법적으로 농사를 지을 수 있는 장점이 있고, 수도시설이나
						간단한 농기구, 거기에 이랑 만들기나 배수로 등을 완비해서 초보자들이 쉽게 농사를 시작할 수 있습니다.</span>
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;"><br>
					<strong><span style="font-size: 11pt;">ㆍ</span></strong> 주말, 휴일 등
						여기시간을 이용하여 가족 단위로 채소등을 가꾸는 도시 또는 도시 근교의 농장<br>
					<strong><span style="font-size: 11pt;">ㆍ</span></strong> 보통 구획당
						2~10평 규모로 매년 2-4월 경에 분양해서 11~12월까지 지속하는 형태로 운영됨.<br>
					<strong><span style="font-size: 11pt;">ㆍ</span></strong> 농협이 지난
						1993년부터 농가 소득 증대의 일환으로서 각 지역의 지역농협을 통해 텃밭을 분양하면서 본격적으로 활성화되기 시작함</span><span
						style="font-size: 11pt;">&nbsp;</span>
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;">&nbsp;</span>
				</p>
				<p align="center" style="text-align: center;">
					&nbsp;
				</p>
				<p align="right" style="text-align: right;">
					<br>
				</p>
				<p align="center">&nbsp;</p>
				<p align="center">
					<img
						src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/E7F544D4-EC34-18F1-20C4-3975C3243920.jpg">&nbsp;
				</p>
				<p align="center" style="text-align: center;">
					<span style="font-size: 24pt;"><span
						style="color: rgb(37, 37, 37); font-family:"
						나눔명조",nanummyeongjo,serif;"="">옥상정원 텃밭</span></span>
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;"></span>&nbsp;
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;">급속한 도시화로 인한 인구집중과 고층, 고밀의
						건축물의 증가는 더 이상 도심에서 동,식물이 살수 없는 환경이 되었고 도시민은 오염된 환경 속에서 살아가고 있습니다.
						이러한 도시화는 땅이라고 하는 자연지반을 없애고 콘크리트와 아스팔트로 뒤덮어 버렸습니다. 특히 대도시의 경우, 녹지는
						고층건물, 도로, 주차장 등으로 변하여 점점 사라지고 있는데 옥상은 이러한 도시공간에서 적은 비용으로 녹지를 확보할 수
						있는 좋은 대안이 되고 있습니다.<br>
					</span><span style="font-size: 11pt;">&nbsp;</span>
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;">최근 국내에서도 서울, 부산, 인천 등 대도시의
						생활주변에 녹지공간을 조성하기 위한 노력의 하나로 많은 옥상정원이 도입되고 있습니다. 옥상은 더 이상 버려진 공간이
						아닌 식물재배와 정원을 즐기는 장소, 부가가치를 높여 소비자를 끌어드리는 장소, 자연과 공생의 장소로 탈바꿈 되어가고
						있습니다.</span><span style="font-size: 11pt;">&nbsp;</span>
				</p>
				<p align="right" style="text-align: right;">&nbsp;</p>
				<div style="text-align: center;" align="center">
					
				</div>&nbsp;
				<p>&nbsp;</p>
				<p align="center">&nbsp;</p>
				<p align="center">
					<img
						src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/E7F544D4-EC34-18F1-20C4-3975C3243920.jpg">&nbsp;
				</p>
				<p align="center" style="text-align: center;">
					<span style="font-size: 24pt;"><span
						style="color: rgb(37, 37, 37); font-family:"
						나눔명조",nanummyeongjo,serif;"="">베란다 텃밭</span></span>
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;"></span>&nbsp;
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;"></span><span
						style="font-size: 11pt;">키우는 기쁨과 수확하는 보람, 자녀들의 체험학습을 위해 채소를
						직접 기르고자 하는 가정이 늘고 있습니다. 더욱이, 가속화된 이상기후의 영향으로 채소 가격 변동이 심해 가정 채소재배에
						대한 관심은 더욱 높아졌습니다. 하지만, 도시 빽빽한 빌딩과 아파트가 대표적인 주거공간으로 자리잡아 마당이 있는
						주택보다 아파트에 사는 인구가 훨씬 많습니다. 현재까지 실내에서 많이 키우던 식물은 주로 관엽식물이었다는데, 채소
						기르기에 도전해 보는 것은 색다른 즐거움을 안겨줄 것입니다. 실내는 접근이 쉽고, 부담 없이 시작할 수 있어 좋고 가장
						가까이에 채소정원을 만들 수 있어 좋습니다. 우리의 일상 생활공간에 도시농업을 들여옴으로써 지속적인 관리가 가능하고
						수확해서 즉시 이용이 가능해서 천연 냉장고 역할을 할 것입니다.</span>&nbsp;
				</p>
				<p align="left" style="text-align: left;">&nbsp;</p>
				<p align="right" style="text-align: right;">&nbsp;</p>
				<div style="text-align: center;" align="center">
					
				</div>&nbsp;
				<p>&nbsp;</p>
				<span style="font-size: 11pt;"><p align="center">&nbsp;</p>
					<p align="center">
						<img
							src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/E7F544D4-EC34-18F1-20C4-3975C3243920.jpg">&nbsp;
					</p>
					<p align="center" style="text-align: center;">
						<span style="font-size: 24pt;"><span
							style="color: rgb(37, 37, 37); font-family:"
							나눔명조",nanummyeongjo,serif;"="">스쿨팜 텃밭(학교텃밭)</span></span>
					</p>
					<p align="left" style="text-align: left;">
						<span style="font-size: 11pt;"></span>&nbsp;
					</p>
					<p align="left" style="text-align: left;">
						<span style="font-size: 11pt;">학교농장, 즉 스쿨팜(School Farm)은 학교
							공간에 농장을 조성하여 학생들에게 농업에 대한 경험과 지식을 제공하고, 농촌과 농업의 중요성을 인식시키며, 나아가
							학교 구성원 및 집단 밖 구성원들과의 협동과 건강한 상호작용을 목적으로 조성되는 공동체 정원의 한 형태라 할 수
							있습니다.</span><span style="font-size: 11pt;">&nbsp;</span>
					</p>
					<p align="left" style="text-align: left;">
						<span style="font-size: 11pt;"></span><span
							style="font-size: 11pt;">&nbsp;</span>
					</p>
					<p align="left" style="text-align: left;">
						<span style="font-size: 11pt;">스쿨팜의 개념은 ‘스쿨(School)’이라는 학교와
							‘팜(Farm)’이라는 농장의 합성어로 ‘학교 농장'이라고 간단히 말할 수 있다. 학교에서 학생들이 자주 이용하고
							쉽게 접근할 수 있는 공간에 농장을 조성함으로써 농촌이라는 곳을 늘 생활 속에서 가깝게 느낄 수 있게 하고 일회성
							행사가 아니라 과정 지향적으로 농업 체험 프로그램을 운영하는 것을 목적으로 한다.</span><span
							style="font-size: 11pt;">&nbsp;</span>
					</p>
					<p align="left" style="text-align: left;">&nbsp;</p>
					<p align="center" style="text-align: center;">
						
					</p>
					<p align="right" style="text-align: right;">&nbsp;</p>
					<p align="left" style="text-align: left;">
						<span style="font-size: 11pt;">* 출처 : 도시농업(농촌진흥청), 도시농부
							올빼미의 텃밭 가이드 1 - 밭만들기</span>
					</p></span></span>

		</div>

		<div id="boardcont_menu" style="float:right;">

			<input type="button" value="목록" class="btn" onclick="location='info'">
		</div>
	</div>
</body>
</html>