<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/common/jsp/import.jsp" %>
<title>Insert title here</title>
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
			<li><a href="info_farming_7">농사달력</a></li>
			<li class="active"><a href="info_farming_8">병해충 정보</a></li>
		</ul>
		<hr>
		<p align="center" style="text-align: center;">
				<img
					src="https://www.modunong.or.kr:449/imgFileDownload.jsp?file_path=/editor_img/20151029/017DB2DA-A6E4-0428-D0BC-36A9A59C05F6.jpg">&nbsp;
			</p>
		<p align="center" style="text-align: center;">
				<span style="color: rgb(1, 143, 255); font-size: 24pt;"><strong><span
						style='color: rgb(37, 37, 37); font-family: "나눔명조", NanumMyeongjo, serif;'>병해충 정보</span></strong></span>
			</p>
			<p align="center" style="text-align: center;">
				<strong><span style="font-size: 11pt;"></span></strong>&nbsp;
			</p>
		
		<br>
		<DIV class="container">
			<SPAN class="round lt"></SPAN><SPAN class="round rt"></SPAN>
			<!-- 라운딩효과 -->
			<TABLE class="table talbe-bordered" border="1" cellspacing="0" cellpadding="0"
				summary="감자역병 구동지점 리스트입니다.">
				<!-- border=1  스타일 지웠을 경우를 데이터 정렬 -->

				<COLGROUP>
					<COL width="5%">
					<COL width="17%">
					<COL width="17%">
					<COL width="17%">
					<COL width="44%">
				</COLGROUP>
				<THEAD>
					<TR>
						<TH class="col">작목
							<TH class="col">병해충명                                        
    
						<TH class="col">입력자료
    
						<TH class="col">결과자료
    
						<TH class="col">모형설명
  
					</TR>
  </THEAD>
  <TBODY>
    <tr>
        <td class="ce">논벼</td>
        <td class="ce">세균성벼알마름병</td>
        <td>일 최저기온, 출수일,    이앙일</td>
        <td>감염위험도</td>
        <td>최저기온, 평균상대습도,    최저상대습도, 강우일수 , 풍속의 변수를 이용하여 출수 전 7일의 기상을 분석하여 감염위험성을 추정함</td>
    </tr>
    <tr>
        <td class="ce">논벼</td>
        <td class="ce">잎도열병</td>
        <td>시간별 평균기온, 시간별 엽면습윤시간,    시간별 강우량</td>
        <td>시간별 감염위험도</td>
        <td>지난 5일동안의 이동평균기온이 적온    범위안에 있을 때 감염에 요구되는 최소 누적습윤시간의 충족 여부에 따라 감염위험도를 추정함.</td>
    </tr>
    <tr>
        <td class="ce">논벼</td>
        <td class="ce">잎집무늬마름병</td>
        <td>일평균기온, 일 평균 상대습도, 이앙일    수</td>
        <td>온도기반의 균사생장율, 상대습도 기반    균사생장율, 수직진전율</td>
        <td>온도 기반의 균사생장율과 상대습도    기반의 균사생장율을 이용하여 병반의 수직진전율을 추정함</td>
    </tr>
    <tr>
        <td class="ce">감자</td>
        <td class="ce">감자역병이동평균법</td>
        <td>일 평균온도, 일 평균 상대습도</td>
        <td>병 진전 속도</td>
        <td>환경조건에 따라 변하는 병 진전도의    기울기를 추정함</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">갈색무늬병</td>
        <td>일 강우량, 일 평균기온, 일 평균    상대습도, 누적결로시간</td>
        <td>발아율(%), 병 발생량</td>
        <td>일 평균기온, 일 강우량, 일    평균습도, 일 결로누적시간을 활용하여 포자 비산 시기를 예측한 후 포자 발아율을 계산해서 병 감염 확률을 추정함</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">검은별무늬병</td>
        <td>시간별 평균기온, 시간별 엽면습윤시간,    시간별 강우량</td>
        <td>시간별 감염위험도</td>
        <td>시간별 온도에서 감염에 필요한 최소한의    엽면습윤지속시간 충족 여부로 감염위험도를 계산함.</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">겹무늬썩음병</td>
        <td>일별 최고/최저/평균 기온, 시간별    평균기온, 시간별 엽면습윤시간비율</td>
        <td>사과의 발육단계, 사과의 직경,    포자발아율, 부착기 형성율</td>
        <td>시간별 온도에서 감염에 필요한 최소한의    엽면습윤지속시간 충족 여부로 감염위험도를 계산함.</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">굴나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">복숭아순나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">복숭아순나방붙이</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">복숭아심식나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">복숭아유리나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">사과무늬잎말이나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">사과응애</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">사과탄저병</td>
        <td>시간별 평균기온, 시간별 엽면습윤시간</td>
        <td>감염속도, 감염확률</td>
        <td>시간별 평균기온과 엽면습윤시간을    대입하여 병 감염속도를 구하고, 이를 누적하여 발생확률을 예측함.</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">애모무늬잎말이나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">사과</td>
        <td class="ce">점박이응애</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">가루깍지벌레</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">검은별무늬병</td>
        <td>시간별 평균기온, 시간별 엽면습윤시간,    시간별 강우량</td>
        <td>시간별 감염위험도</td>
        <td>시간별 온도에서 감염에 필요한 최소한의    엽면습윤지속시간 충족 여부로 감염위험도를 계산함.</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">굴나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">꼬마배나무이</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">복숭아순나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">복숭아순나방붙이</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">복숭아심식나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">복숭아유리나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">붉은별무늬병</td>
        <td>시간별 평균기온, 시간별 엽면습윤시간,    시간별 강우량</td>
        <td>시간별 감염위험도</td>
        <td>시간별 온도에서 감염에 필요한 최소한의    엽면습윤지속시간 충족 여부로 감염위험도를 계산함.</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">사과무늬잎말이나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">사과응애</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">애모무늬잎말이나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">배</td>
        <td class="ce">점박이응애</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">포도</td>
        <td class="ce">포도노균병</td>
        <td>시간별 평균기온, 시간엽 엽면습윤 시간</td>
        <td>시간별 감염위험도</td>
        <td>시간별 온도에서 감염에 필요한 최소한의    엽면습윤지속시간 충족 여부로 감염위험도를 계산함.</td>
    </tr>
    <tr>
        <td class="ce">감귤</td>
        <td class="ce">감귤더뎅이병</td>
        <td>시간별 평균기온, 시간별 엽면습윤시간</td>
        <td>시간별 감염위험도</td>
        <td>각각 온도에 따른 포자의 생장속도를    구하고, 그 생장속도 누적 값을 포자형성 예측 모형에 대입하여 나온 값을 이용하여 방제여부를 판단함.</td>
    </tr>
    <tr>
        <td class="ce">감귤</td>
        <td class="ce">감귤화살깍지벌레</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">감귤</td>
        <td class="ce">볼록총채벌레</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">고추</td>
        <td class="ce">고추세균성점무늬병</td>
        <td>일 평균기온, 일 누적강수량</td>
        <td>감염위험도</td>
        <td>병원균이 적정 수준 이상의 개체군 밀도에 도달한 시기를 추정하여    세균성점무늬병의 초발일을 예측함</td>
    </tr>
    <tr>
        <td class="ce">고추</td>
        <td class="ce">고추역병</td>
        <td>일 평균기온, 일 평균습도, 일    누적강수량, 토성</td>
        <td>감염위험도</td>
        <td>포장의 지온과 토양수분을 기온으로부터    추정하여, 역병 병원균 유주자낭에서 유주자가 유출되는 위험도를 바탕으로 초발일을 추정하는 모델</td>
    </tr>
    <tr>
        <td class="ce">고추</td>
        <td class="ce">고추탄저병</td>
        <td>시간별 평균기온, 시간별 엽면습윤시간</td>
        <td>시간별 감염위험도</td>
        <td>시간별 온도에서 감염에 필요한 최소한의    엽면습윤지속시간 충족 여부로 감염위험도를 계산함.</td>
    </tr>
    <tr>
        <td class="ce">고추</td>
        <td class="ce">고추풋마름병</td>
        <td>일 평균기온, 일 누적강수량</td>
        <td>감염위험도</td>
        <td>주어진 온도에 따라 병원균 밀도가    2배로 증식하는데 소요되는 시간을 추정하여 감염위험도를 계산함.</td>
    </tr>
    <tr>
        <td class="ce">고추</td>
        <td class="ce">꽃노랑총채벌레</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">고추</td>
        <td class="ce">담배나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">고추</td>
        <td class="ce">파밤나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
    <tr>
        <td class="ce">파</td>
        <td class="ce">파밤나방</td>
        <td>일평균기온</td>
        <td>생육단계별 적산온도</td>
        <td>발육영점온도 이상의 일 평균 기온을    누적하여 발육단계를 예측</td>
    </tr>
  </TBODY>
  </TABLE>
		</div>
<hr><hr>
<div id="boardcont_menu" style="float: right;">

								<input type="button" value="목록" class="btn"
									onclick="location='info'">
		</div>

						</div>
</body>
</html>