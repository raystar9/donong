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
			<li><a href="info_farming_6">수확하기</a></li>
			<li class="active"><a href="info_farming_7">농사달력</a></li>
			<li><a href="info_farming_8">병해충 정보</a></li>
		</ul>
		<hr>
		<div class="bbs_view_cont bbs_view_cont_1">
			<span></span>
			<p align="center" style="text-align: center;">
				<img
					src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/017DB2DA-A6E4-0428-D0BC-36A9A59C05F6.jpg">&nbsp;
			</p>
			<p align="center" style="text-align: center;">
				<span style="color: rgb(1, 143, 255); font-size: 24pt;"><strong><span
						style='color: rgb(37, 37, 37); font-family: "나눔명조", NanumMyeongjo, serif;'>텃밭
							작물별 파종시기</span></strong></span>
			</p>
			<p align="center" style="text-align: center;">
				<strong><span style="font-size: 11pt;"></span></strong>&nbsp;
			</p>
			<p align="center" style="text-align: center;">
				<strong><span style="font-size: 12pt;">텃</span></strong><strong><span
					style="font-size: 12pt;">밭을 유용하게 잘 활용하기 위해서는 작부체계를 잘 세워야
						합니다. 텃밭에서 나는 채소는 우리가족 식탁에 올리기 때문에 가족들이 좋아하는 채소와 가꾸기 쉬운 채소를 선택하는 것이
						좋습니다. 아래 제시하는 텃밭 유형은 하나의 예시일 뿐이고 개개인의 취향에 따라 다양한 작물을 넣을 수 <span
						style="font-size: 12pt;">있습</span>
				</span><span style="font-size: 12pt;">니다.</span></strong><span
					style="font-size: 12pt;">&nbsp;</span>
			</p>
			<p align="center" style="text-align: center;">
				<strong></strong>&nbsp;
			</p>
			<p align="left" style="text-align: left;">
				<strong><span style="font-size: 11pt;">* 출처 :
						도시농업지도자 양성교육 교재</span></strong><span style="font-size: 11pt;">&nbsp;</span>
			</p>
			<p align="left" style="text-align: left;">
				<strong><span style="font-size: 11pt;"></span></strong>&nbsp;
			</p>
			<p>
				<strong><span style="font-size: 11pt;"></span></strong>
			</p>
			<table class="__se_tbl" style="background-color: rgb(199, 199, 199);"
				border="0" cellspacing="1" cellpadding="0" _se2_tbl_template="7">
				<tbody>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(255, 255, 255); font-weight: normal; background-color: rgb(51, 51, 51);"><p
								align="center">
								<span style="font-size: 11pt;"><strong>&nbsp;파종시기</strong></span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; text-align: left; color: rgb(255, 255, 255); font-weight: normal; background-color: rgb(51, 51, 51);"><p
								align="center">
								<span style="font-size: 11pt;"><strong>종류</strong></span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; text-align: left; color: rgb(255, 255, 255); font-weight: normal; background-color: rgb(51, 51, 51);"><p
								align="center">
								<span style="font-size: 11pt;"><strong>종자</strong></span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(255, 255, 255); font-weight: normal; background-color: rgb(51, 51, 51);"><span
							style="font-size: 11pt;"><p align="center">
									<span style="font-size: 11pt;"><strong>간격(cm)</strong></span>
								</p></span></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(255, 255, 255); font-weight: normal; background-color: rgb(51, 51, 51);"><p
								align="center" style="text-align: center;">
								&nbsp;<span style="font-size: 11pt;"><strong>수확시기&nbsp;</strong></span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">3월말~4월초&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">감자</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;씨감자</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">25</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">6월말~7월초</span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;4월초~4월하순</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">상추, 쑥갓&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">씨앗 또는 모종&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">25</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">5월중순~6월말</span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">강낭콩</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">씨앗</span><span
									style="font-size: 11pt;">&nbsp;</span>&nbsp;
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">30</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">7월초순</span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">얼갈이배추</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">10</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">5월중순~</span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;열무</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">5</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">5월중순~</span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;시금치</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">5</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">5월중순~</span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;아욱</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;5</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">5월중순~</span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;대파</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;씨앗 또는 모종</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">10</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">(모종)6월초순~</span>
							</p></td>


					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;당근</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;씨앗</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">10</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">7월초~</span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;5월초</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;토마토</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;모종</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">45</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">6월하순~</span>
							</p></td>


					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;가지</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">45</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">6월하순~</span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;오이</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">40</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">6월하순~</span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;고추</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">45</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">6월하순~</span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;애호박</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">40</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">6월하순~</span>
							</p></td>
					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;8월말~9월초</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;김장배추</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">모종&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">46</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">11월중순~</span>
							</p></td>
					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;김장무</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">씨앗&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">35</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">11월초~</span>
							</p></td>
					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;알타리무</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">10</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">11월초~</span>
							</p></td>

					</tr>
					<tr>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; text-align: left; color: rgb(102, 102, 102); font-weight: normal; background-color: rgb(248, 248, 248);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">&nbsp;쪽파</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 147px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">씨쪽파</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">20</span>
							</p></td>
						<td
							style="padding: 3px 4px 2px; width: 146px; height: 22px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><p
								align="center">
								<span style="font-size: 11pt;">11월초~</span>
							</p></td>

					</tr>

				</tbody>
			</table>
			<p>&nbsp;</p>
			<span style="font-size: 11pt;"><p align="center"
					style="text-align: center;">&nbsp;</p></span>
			<p>&nbsp;</p>
			<span style="font-size: 11pt;"><p>&nbsp;</p></span>
			<p align="center" style="text-align: center;">&nbsp;</p>

		</div>
<hr><hr>
		<div id="boardcont_menu" style="float:right;">

			<input type="button" value="목록" class="btn" onclick="location='info'">
		</div>
	</div>
</body>
</html>