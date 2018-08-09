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
			<li><a href="info_farming_5">태풍과 장마</a></li>
			<li class="active"><a href="info_farming_6">수확하기</a></li>
			<li><a href="info_farming_7">농사달력</a></li>
			<li><a href="info_farming_8">병해충 정보</a></li>
		</ul>
		<hr>
		<div class="bbs_view_cont bbs_view_cont_1">
			<span></span><span></span>
			<p align="center" style="text-align: center;">
				<img
					src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/017DB2DA-A6E4-0428-D0BC-36A9A59C05F6.jpg">&nbsp;
			</p>
			<p align="center" style="text-align: center;">
				<span style="color: rgb(1, 143, 255); font-size: 24pt;"><strong><span
						style='color: rgb(37, 37, 37); font-family: "나눔명조", NanumMyeongjo, serif;'>수확시기</span></strong></span>
			</p>
			<p align="center" style="text-align: center;">
				<strong><span style="font-size: 11pt;"></span></strong>&nbsp;
			</p>
			<p align="center" style="text-align: center;">
				<strong><span style="font-size: 12pt;">농작물을 적기에 수확하는
						일은 매우 중요하다.</span></strong>&nbsp;
			</p>
			<p align="center" style="text-align: center;">
				<strong><span style="font-size: 12pt;">적기에 수확한 농산물은
						고유 품질 특성을 그대로 갖고 있어 신선하며 영양가치도 매우 높은 상태로 식탁에 올릴 수 있다.</span></strong><span
					style="font-size: 12pt;">&nbsp;</span>&nbsp;
			</p>
			<p align="center" style="text-align: center;">
				<strong><span style="font-size: 11pt;"></span></strong>&nbsp;
			</p>
			<p align="left" style="text-align: left;">
				<span><span style="font-size: 11pt;">농작물의 수확기 판단은 농작물의
						종류에 따라 다르다. 보리 알곡을 생산하는 보리나 풋콩과 알콩을 생산하는 콩 그리고 여러 가지 채소들의 종류에 따라
						숙기가 제 각각이고 제때 수확을 해야 한다. 잎을 먹는 채소는 일정한 키가 크면 수확한다. 그렇지만 과일을 먹는
						채소들은 과일의 색깔이라든지, 단단한 정도 또는 당도, 크기, 모양 등을 잘 보고 수확해야 한다.</span>&nbsp;</span>
			</p>
			<p align="center" style="text-align: center;">&nbsp;</p>
			<p align="center" style="text-align: center;">
				<span style="font-size: 11pt;"></span>&nbsp;
			</p>
			<span style="font-size: 11pt;"><p align="center"
					style="text-align: center;">
					<img
						src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/017DB2DA-A6E4-0428-D0BC-36A9A59C05F6.jpg">&nbsp;
				</p>
				<p align="center" style="text-align: center;">
					<span style="color: rgb(1, 143, 255); font-size: 24pt;"><font
						color="#000000"><span
							style='color: rgb(37, 37, 37); font-family: "나눔명조", NanumMyeongjo, serif;'>수확하기</span></font></span>
				</p>
				<p align="center" style="text-align: center;">
					<span></span>&nbsp;
				</p>
				<p align="center" style="text-align: center;">
					<strong><span style="font-size: 12pt;">직접 기른 농산물을
							수확하는 기쁨은 무엇과도 비교할 수 없습니다. 농산물을 거두는 요령을 알아봅시다.</span></strong>
				</p>
				<p align="left" style="text-align: left;">&nbsp;</p>
				<p align="left" style="text-align: left;">
					<strong><span style="font-size: 11pt;">잎채소</span></strong><br>
					<span style="font-size: 11pt;">상추나 치커리 등 잎채소는 일주일에 한 번 정도 잎을
						수확하는 것이 적당합니다.</span><br>
					<span style="font-size: 11pt;">채소는 오전에 수확하는 것이 좋은데, 낮에 식물체
						온도가 올라가면 호흡이 많아져 쉽게 시들거나 영양분이 손실되기 때문입니다.</span><br>
					<span style="font-size: 11pt;">상추 등 쌈채소는 잎을 딸 때 되도록 바짝 따 주는
						것이 좋다. 그래야 상처를 통해서 병에 감염되지 않고 계속해서 잘 자랍니다.</span>
				</p>
				<p align="left" style="text-align: left;">&nbsp;</p>
				<p align="left" style="text-align: left;">
					<strong><span style="font-size: 11pt;">열매채소</span></strong><br>
					<span style="font-size: 11pt;">과채류 열매는 익는 대로 바로 수확하는 것이
						좋습니다.</span><br>
					<span style="font-size: 11pt;">열매를 제때에 수확하지 않은 열매로 양분이 집중되기
						때문에 그 다음에 맺힌 열매들이 제대로 크지도 못하고 떨어져 버립니다.</span><br>
					<span style="font-size: 11pt;">토마토나 오이 등은 계속해서 위로 자라므로 키 2m
						이내에서 윗 순을 쳐서 더 이상 자라지 못하게 해줍니다.</span>
				</p>
				<p align="left" style="text-align: left;">&nbsp;</p>
				<p align="left" style="text-align: left;">
					<strong><span style="font-size: 11pt;">채소를 신선하게
							저장하는 방법</span></strong><br>
					<span style="font-size: 11pt;">수확한 채소를 옆으로 뉘지 않고 수직으로 세워서
						저장을 하면 신선하게 저장할 수 있습니다.</span><br>
					<span style="font-size: 11pt;">아스파라거스나 시금치를 수직으로 보관하면 수평으로
						보관한 것보다 엽록소 함량이 높고 맛도 유지됩니다.</span>
				</p></span>
			<p align="center" style="text-align: center;">
				<img
					src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151104/B81679A0-FD4C-FDC8-09B4-D0FF14C0B908.jpg"><img
					style="line-height: 1.5;"
					src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151104/8F7BEA48-B6C5-2E42-B382-F8BAADE8C6F2.jpg"><img
					style="line-height: 1.5;"
					src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151104/72CCB1DE-FB8F-4B69-3FC7-6A4CCB48586B.jpg"><span
					style="line-height: 1.5;">&nbsp;</span>
			</p>
			<p align="center" style="text-align: center;">&nbsp;</p>
			<p align="center" style="text-align: center;">&nbsp;</p>
			<span style="font-size: 11pt;"><p align="center"
					style="text-align: center;">
					<img
						src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/017DB2DA-A6E4-0428-D0BC-36A9A59C05F6.jpg">&nbsp;
				</p>
				<p align="center" style="text-align: center;">
					<span style="color: rgb(1, 143, 255); font-size: 24pt;"><font
						color="#000000"><span
							style='color: rgb(37, 37, 37); font-family: "나눔명조", NanumMyeongjo, serif;'>작물별
								수확시기</span></font></span>
				</p>
				<p align="center" style="text-align: center;">
					<span></span>&nbsp;
				</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;">잎을 먹는 채소나 뿌리를 먹는 채소는 아주 크게
						성숙하였을 때보다 성숙 전에 수확하여 이용하는 것이 좋다. 채소는 각기 자라는 특성이 다를 뿐만 아니라 풍미가 다르기
						때문에 당연히 수확하는 때가 각기 다를 수 밖에 없다 많은 작물들이 미숙했을 때는 녹색을 띄다가 성숙기에 도달하면
						노란색, 붉은색 자주색 등으로 그 작물이 갖는 고유의 색깔을 나타낸다. 이처럼 색깔의 변화를 보고 숙기를 판정하는
						방법이 있다. 또한 식물의 크기의 변화도 숙기 판정의 중요한 요소이다. 잎의 크기나 과일의 크기 등을 관찰하여 수확을
						하는 것이다. 주로 과일채소에 적용한다. 콩은 잎이 누렇게 변하여 떨어지고 콩 꼬투리의 80~90% 이상이 고유한
						성숙색깔로 변하는 시기를 일반적인 성숙기로 본다. 이로부터 7~14일이 지난 시기가 콩 수확 적기가 되며 이때 콩깍지와
						종실의 수분함량은 18~20%정도 된다. 수확 적기는 일반적으로 개화 후 60일경이 된다. 그루콩의 수확기는 대체로
						중부지방에서는 10월 살,중순, 남부지방에서는 10월 중,하순경이 된다. 완두콩은 꽃 핀 후 10~15일 경에
						수확하는데 이틀에 한 번씩 수확한다.</span>
				</p>
				<p align="left" style="text-align: left;">&nbsp;</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;">옥수수를 너무 빨리 수확하게 되면 당분함량은 높으나
						씨알이 덜 여물게 되고 수확을 너무 늦추면 이삭이 잘 여물지만 단맛이 떨어지고 씨알껍질이 쭈글쭈글해져서 상품가치가 크게
						떨어진다. 정확한 수확기 예측은 수염이 나온 뒤 20일경에 이삭 윗부분 껍질을 벗겨보아 색깔을 확인하거나 터트려 유즙이
						묽게 나오는 지 확인하는 것이 좋다. 옥수수는 20일 전후에 수확하고 찰 옥수수는 25일경에 수확하는 것이 좋다.
						옥수수는 가능한 오전에 수확하여 될 수 있는 대로 옥수수 이삭의 온도를 낮추어 저장하고 가능한 수확당일 짧은 시간 안에
						쪄서 먹는 것이 좋다. 시간이 경과할수록 당분은 전분으로 변하여 단맛이 사라진다. 땅콩은 반드시 첫서리가 오기 전에
						끝내야 한다. 땅콩의 꽃은 일시에 피지 않고 개화기가 길기 때문에 성수되는 것도 기간이 길게 이어진다. 일반적으로 서리
						오기 전에&nbsp; 수확하는 것이 좋다. 너무 일찍 수확한다면 생육기간이 부족한 우리나라에서는 미숙한 꼬투리가 많아
						수량 및 품질이 떨어지고, 너무 늦게 수확하면 땅콩이 땅속으로 많이 떨어진다. 서리를 맞아도 땅콩 꼬투리가
						떨어져버리므로 주의한다. 과일 채소에서 수확시기의 중요한 단서는 개화 후 경과일수이다. 개화하고 나서 며칠을
						경과하였냐에 따라서 수확기를 판정하는 것인데 가장 과학적이며 확실한 수확기 판정방법이다. 이외에도 과실의 단단한 정도나
						과실의 맛 등을 측정하여 숙기를 판정한다.</span>
				</p>
				<p align="left" style="text-align: left;">&nbsp;</p>
				<p align="left" style="text-align: left;">
					<strong><span style="font-size: 11pt;">(가) 잎이나 줄기를
							수확하는 채소</span></strong><br>
					<span style="font-size: 11pt;">상추나 치커리 같이 잎을 따는 채소는 1~2일마다
						새잎이 한 장 씩 계속 나온다. 그러므로 잎 따기를 적어도 1주일에 한번 씩 해주어야 한다. 수확을 안 하고 미루면
						잎이 너무 커지고 조직이 거칠어져서 맛이 떨어진다.</span><br>
					<strong><span style="font-size: 11pt;">(나) 열매를 따는
							채소</span></strong><br>
					<span style="font-size: 11pt;">열매를 따는 채소에서 가장 중요한 점은 제때에
						수확하는 것이다. 제 때에 수확을 못하면 그 다음에 맺힌 열매들이 크지 못하고 떨어져 버린다. 체내의 양분이 따지않은
						열매로 집중하기 때문이다.</span><br>
					<strong><span style="font-size: 11pt;">(다) 뿌리를 캐는
							채소</span></strong><br>
					<span style="font-size: 11pt;">뿌리를 캐는 채소를 수확할 때 ㅈ의할 점은 뿌리가
						상하지 않게 수확하는 것이다. 수확하는 시기는 파나 무, 당근 등은 어느 정도 자라면 수확할 수 있고, 마늘과 감자는
						윗 줄기가 노랗게 변하기 시작하면 고구마는 첫서리가 올 때 수확하는 것이 좋다.</span>
				</p>
				<p align="left" style="text-align: left;">&nbsp;</p>
				<p align="left" style="text-align: left;">
					<strong><span style="font-size: 11pt;">표 1
							-&nbsp;주요 과일채소의 수확 적기</span></strong><span style="font-size: 11pt;">&nbsp;</span>
				</p>
				<p>
					<span></span>
				</p>
				<table class="__se_tbl"
					style="background-color: rgb(199, 199, 199);" border="0"
					cellspacing="1" cellpadding="0" _se2_tbl_template="7">
					<tbody>
						<tr>
							<td
								style="padding: 3px 4px 2px; width: 185px; height: 22px; text-align: left; color: rgb(255, 255, 255); font-weight: normal; background-color: rgb(51, 51, 51);"><p
									align="center">
									<strong>&nbsp;구분</strong>
								</p></td>
							<td
								style="padding: 3px 4px 2px; width: 185px; height: 22px; text-align: left; color: rgb(255, 255, 255); font-weight: normal; background-color: rgb(51, 51, 51);"><p
									align="center">
									<strong>개화 후 일수</strong>
								</p></td>
							<td
								style="padding: 3px 4px 2px; width: 185px; height: 22px; text-align: left; color: rgb(255, 255, 255); font-weight: normal; background-color: rgb(51, 51, 51);"><p
									align="center">
									<strong>구분&nbsp;</strong>
								</p></td>
							<td
								style="padding: 3px 4px 2px; width: 185px; height: 22px; text-align: left; color: rgb(255, 255, 255); font-weight: normal; background-color: rgb(51, 51, 51);"><p
									align="center">
									<strong>&nbsp;개화 후 일수</strong>
								</p></td>
						</tr>
						<tr>
							<td
								style="padding: 3px 4px 2px; width: 185px; height: 110px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
									align="center" style="text-align: center;">오이</p>
								<p align="center" style="text-align: center;">애호박</p>
								<p align="center" style="text-align: center;">늙은 호박</p>
								<p align="center" style="text-align: center;">수박 참외</p></td>
							<td
								style="padding: 3px 4px 2px; width: 185px; height: 110px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
									align="center">&nbsp;10일</p>
								<p align="center">7~10일</p>
								<p align="center">45~50일</p>
								<p align="center">30~35일</p>
								<p align="center">30~40일</p></td>
							<td
								style="padding: 3px 4px 2px; width: 185px; height: 110px; color: rgb(102, 102, 102); background-color: rgb(248, 248, 248);"><p
									align="center" style="text-align: center;">&nbsp;풋고추</p>
								<p align="center" style="text-align: center;">붉은고추</p>
								<p align="center" style="text-align: center;">가지</p>
								<p align="center" style="text-align: center;">토마토</p>
								<p align="center" style="text-align: center;">딸기</p></td>
							<td
								style="padding: 3px 4px 2px; width: 185px; height: 110px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
									align="center">20~25일</p>
								<p align="center">40~45일</p>
								<p align="center">20~30일</p>
								<p align="center">40~50일</p>
								<p align="center">35~40일</p></td>
						</tr>
					</tbody>
				</table>
				<p>&nbsp;</p>
				<p align="left" style="text-align: left;">
					<span></span><span style="font-size: 11pt;">일정한 숙기에 도달한 채소라도
						수확시기를 잘 선택해야 한다. 마늘이나 감자, 당근 등은 비오는 날을 피해서 토양수분이 건조할 때 수확하면 저장기간이
						길어진다. 하루 중 햇볕이 뜨거운 한 낮보다도 아침 또는 저녁에 수확을 해야 생산물의 온도가 낮아 호흡량이 적어서 쉽게
						시들지 않는다.</span>
				</p>
				<p align="left" style="text-align: left;">&nbsp;</p>
				<p align="left" style="text-align: left;">
					<strong><span style="font-size: 11pt;">표 2
							-&nbsp;텃밭 채소의 3.3㎡(평) 수량성</span></strong>
				</p>
				<table class="__se_tbl"
					style="background-color: rgb(199, 199, 199);" border="0"
					cellspacing="1" cellpadding="0" _se2_tbl_template="7">
					<tbody>
						<tr>
							<td
								style="padding: 3px 4px 2px; width: 186px; height: 22px; text-align: left; color: rgb(255, 255, 255); background-color: rgb(51, 51, 51);"><p
									align="center">
									<strong>&nbsp;수량(</strong><strong>3.3㎡)</strong>
								</p></td>
							<td
								style="padding: 3px 4px 2px; width: 571px; height: 22px; text-align: left; color: rgb(255, 255, 255); background-color: rgb(51, 51, 51);"><p
									align="center" style="text-align: center;">
									<strong>채소종류</strong>&nbsp;
								</p></td>
						</tr>
						<tr>
							<td
								style="padding: 3px 4px 2px; width: 186px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
									align="center">
									<strong>&nbsp;2kg이하</strong>
								</p></td>
							<td
								style="padding: 3px 4px 2px; width: 571px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p>&nbsp;마늘,
									건고추, 옥수수, 통, 완두</p></td>
						</tr>
						<tr>
							<td
								style="padding: 3px 4px 2px; width: 186px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
									align="center">
									<strong>&nbsp;3-4kg</strong>
								</p></td>
							<td
								style="padding: 3px 4px 2px; width: 571px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p>&nbsp;생강,
									시금치, 열무, 고구마, 갓</p></td>
						</tr>
						<tr>
							<td
								style="padding: 3px 4px 2px; width: 186px; height: 27px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
									align="center">
									<strong>&nbsp;5-10kg</strong>
								</p></td>
							<td
								style="padding: 3px 4px 2px; width: 571px; height: 27px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p>&nbsp;대파,
									쪽파, 당근, 상추, 들깻잎, 오이, 토마토, 호박, 참외, 가지</p></td>
						</tr>
						<tr>
							<td
								style="padding: 3px 4px 2px; width: 186px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
									align="center">
									<strong>&nbsp;10-20kg</strong>
								</p></td>
							<td
								style="padding: 3px 4px 2px; width: 571px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p>&nbsp;무,
									배추, 양배추, 부추</p></td>
						</tr>
					</tbody>
				</table>
				<p>&nbsp;&nbsp;</p>
				<p align="left" style="text-align: left;">
					<span style="font-size: 11pt;">* 출처 : 도시농업(농진청), 온가족이 함께하는
						유기농 텃밭 채소 가꾸기(농진청)</span>
				</p></span>
			<p align="center" style="text-align: center;">&nbsp;</p>

		</div>
<hr><hr>
		<div id="boardcont_menu" style="float:right;">

			<input type="button" value="목록" class="btn" onclick="location='info'">
		</div>
	</div>
</body>
</html>