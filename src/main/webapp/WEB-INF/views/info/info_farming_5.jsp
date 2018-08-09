<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/common/jsp/import.jsp" %>
<title>나만따라와 도시농부</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		
		<h3>농사짓기</h3>
		<h4>농사 단계를 선택하여 원하는 정보를 얻으세요.</h4>
		<hr>
		<ul class="nav nav-tabs">
			<li><a href="info_farming_1">밭만들기</a></li>
			<li><a href="info_farming_2">파종과 육묘, 정식</a></li>
			<li><a href="info_farming_3">작물돌보기</a></li>
			<li><a href="info_farming_4">비료와 농약</a></li>
			<li class="active"><a href="info_farming_5">태풍과 장마</a></li>
			<li><a href="info_farming_6">수확하기</a></li>
			<li><a href="info_farming_7">농사달력</a></li>
			<li><a href="info_farming_8">병해충 정보</a></li>
		</ul>
		<hr>
		<div class="bbs_view_cont bbs_view_cont_1">
			<p align="center" style="text-align: center;">&nbsp;</p>
			<span style="font-size: 11pt;"><p align="center"
					style="text-align: center;">
					<img
						src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/017DB2DA-A6E4-0428-D0BC-36A9A59C05F6.jpg">&nbsp;
				</p>
				<p align="center" style="text-align: center;">
					<span style="color: rgb(1, 143, 255); font-size: 24pt;"><font
						color="#000000"><span style="color: rgb(255, 0, 84);"><strong><span
									style="color: rgb(37, 37, 37); font-family: &amp; quot;나눔명조&amp;quot;,NanumMyeongjo,serif;">장마에
										오는 장해들</span></strong></span></font></span>
				</p>
				<p align="center" style="text-align: center;">
					<span></span>&nbsp;
				</p>
				<p align="center" style="text-align: center;">
					<span style="font-size: 12pt;"><strong>봄에 파종하거나
							모종으로 심은 작물들은 5월부터 본격적인 수확이 시작되어 6월에 절정에 이릅니다. 한창 농사짓는 재미에 푹 빠져 있을
							때지요. </strong></span>&nbsp;
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;"></span>&nbsp;
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;">그러나 이제부터 수난이 시작됩니다. 바로 장마입니다.
						요즘은 장마가 다로 없다고도 하고 장마 대신 우기라고 해야 한다고도 하나, 어쨌든 비가 정신 없이 오는 시기가 한여름에
						꼭 있습니다. 비가 오니 당연히 햇빛이 부족합니다.</span>&nbsp;
				</p>
				<p align="left" style="text-align: left;">&nbsp;</p>
				<p align="left" style="text-align: left;">
					<strong><span style="font-size: 11pt;">ㆍ 과습</span></strong><span
						style="font-size: 11pt;"> : 비가 계속 오면 작물 뿌리가 물에 잠겨 있는 날이
						길어집니다. 계속된 비로 흙 속 공기층이 줄어들어 작물의 상태가 나빠집니다. 특히 배수가 안 좋은 밭은 더 심해지고
						과습에 약한 고추 같은 작물들은 사흘만 물에 잠기면 죽어나가고, 빗물로 인해 병균이 전염됩니다. 상추 같은 쌈채소류는
						멀칭하지 않은 경우 빗물에 흙물이 튀어 잎이 녹거나 썩어버립니다.</span><br>
					<strong><span style="font-size: 11pt;">ㆍ 햇빛부족</span></strong><span
						style="font-size: 11pt;"> :&nbsp; 흐린 날씨가 오래 되면 작물들은 광합성에
						필요한 햇빛을 확보하지 못해 생육이 나빠집니다. 이 경우는 거의 대처가 힘듭니다.</span><br>
					<strong><span style="font-size: 11pt;">ㆍ 두둑의 유실</span></strong><span
						style="font-size: 11pt;"> : 장마 때 세찬 비로 인해 두둑의 흙이 빗물에 흘러내려갈
						수 있습니다. 멀칭하지 않은 밭은 두둑의 높이가 낮아지고, 반면 고랑은 흙이 쌓여 높아집니다. 두둑의 흙은 퇴비를 줘서
						작물이 잘 자라게 만든 거름기가 많은 흙인데 흙은 얼마든지 충분하고 언제든지 더 구할 수 있다고 생각하지만, 작물이
						자라기에 좋은 거름기 있는 흙은 그렇게 충분하지 않습니다. 매년 장마 때마다 유실되는 좋은 흙은 굉장한 자원
						낭비입니다. 그래서 이 흙의 유실을 가급적 막는 것이 중요합니다.</span><br>
					<strong><span style="font-size: 11pt;">ㆍ 지주의 쓰러짐</span></strong><span
						style="font-size: 11pt;"> : 초봄에 땅에 얕게 박아둔 지주는 장마 중 반드시 문제가
						됩니다. 장마 기간에는 표면에서부터 어느 정도까지는 땅이 물에 잠겨 물렁물렁해집니다. 그런 상태에서 얕게 박힌 지주는
						흔들거리게 됩니다. 거기에 작물이 좀 무겁거나 균형이 깨지면 순식간에 쓰러집니다.</span>&nbsp;
				</p></span>
			<p align="center" style="text-align: center;">&nbsp;</p>
			<p align="center" style="text-align: center;">&nbsp;</p>
			<p align="center" style="text-align: center;">
				<span style="font-size: 11pt;"></span><img
					src="resources/images/farming51.png"><img
					src="resources/images/farming52.png"><br>
				<br>
				<img
					src="resources/images/farming53.png"><img
					src="resources/images/farming54.png"><img
					src="resources/images/farming55.png"><br>
				<br>
				<img
					src="resources/images/farming56.png">&nbsp;
			</p>
			<p align="center" style="text-align: center;">
				<span style="font-size: 11pt;"></span>&nbsp;
			</p>
			<span style="font-size: 11pt;"><p align="center"
					style="text-align: center;">
					<img
						src="resources/images/farming57.png">&nbsp;
				</p>
				<p align="center" style="text-align: center;">
					<span style="color: rgb(1, 143, 255); font-size: 24pt;"><font
						color="#000000"><span style="color: rgb(255, 0, 84);"><span
								style="color: rgb(37, 37, 37); font-family: &amp; quot;나눔명조&amp;quot;,NanumMyeongjo,serif;">배수로
									확보와 두둑의 유실 방지</span></span></font></span>
				</p>
				<p align="center" style="text-align: center;">
					<span></span>&nbsp;
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;">장마 기간 동안 햇빛이 부족한 것은 해결하기 힘드나,
						우리의 힘으로 할 수 있는 것은 최대한 빗물이 빠져나가도록 배수로를 확보해주는 것입니다. 그래도 지하수위가 높거나
						배수가 불량한 밭은 물빠짐이 힘드니 두둑을 높여서 밭이 물에 잠기는 시간을 줄여주는 것도 좋습니다.</span>
				</p>
				<p align="left" style="text-align: left;">&nbsp;</p>
				<p align="center" style="text-align: center;">
					<img
						src="resources/images/farming57.png"><img
						src="resources/images/farming58.png"><img
						src="resources/images/farming59.png">&nbsp;
					<br>
					<br>
					<img
						src="resources/images/farming60.png"><img
						src="resources/images/farming61.png"><br>
					<br>
					<img
						src="resources/images/farming62.png">
				</p>
				<p align="left" style="text-align: left;">&nbsp;</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;">* 출처 : 도시농부 올빼미의 텃밭 가이드 1 -
						밭만들기 편</span>
				</p></span>

		</div>
<hr><hr>
		<div id="boardcont_menu" style="float:right;">

			<input type="button" value="목록" class="btn" onclick="location='info'">
		</div>
	</div>
</body>
</html>