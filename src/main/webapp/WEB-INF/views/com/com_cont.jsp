<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<body>
<div class="container">
<h2 class="comcont_title" style="witdh:370px">
커뮤니티 게시판</h2>
<c:set var="boarddata" value="${boarddata}"/>
<div>
<h4>${bbsbean.category }|${bbsbean.subject}</h4>
	<h5>글쓴이 ${bbsbean.writer} ${bbsbean.regitdate} 조회 ${bbsbean.readcount }</h5>
	<hr>
		<div class="container">
		<div class="col-sm-9" style="float:left;">
		<c:if test="${!empty bbsbean.filename }">
<img src="resources/upload/${bbsbean.filename }">
</c:if>
<br>
		${content}한국어로 보통 시라고 할 때에는 그 형식적 측면을 주로 가리켜 문학의 한 장르로서의 시작품(詩作品:poem)을 말할 경우와, 
		그 작품이 주는 예술적 감동의 내실(內實)이라고 할 수 있는 시정(詩情) 내지 시적 요소(詩的要素:poetry)를 말할 경우가 있다. 
		전자는 일정한 형식에 의하여 통합된 언어의 울림 ·리듬 ·하모니 등의 음악적 요소와 언어에 의한 이미지 ·시각(視覺) 등 회화적 요소에 의해 독자의 감각이나 감정에 호소하고 또는 상상력을 자극하여 깊은 감명을
		 던져 주는 것을 목적으로 하는 문학작품의 일종으로, 거기에서는 언어의 정동적(情動的)인 기능을 최대한 발휘할 수 있는 언어의 배열과 구성(構成)이 요구된다. 후자에 관해서는 시작품뿐만 아니라 소설
		  ·희곡 등의 문학작품으로부터 미술 ·음악 ·영화 ·건축 등의 예술작품, 더 넓혀서 자연이나 인사(人事) ·사회현상 속까지 그 존재를 인정하는 일이 가능하다.
[네이버 지식백과] 시 [詩] (두산백과)
<br>

</div>
<div class="col-sm-3" >
		<input type="button" value="목록" class="btn" style="vertical-align: top,right;float:right;" onclick="location='communitylist?page=${page}'">
	</div>
	</div>
	<hr>
	<c:if test="${!empty bbsbean.filename }">
	
	파일 다운로드
	
	<a href="./download.file?filename=${bbsbean.filename}&filepath=${bbsbean.filepath } ">${bbsbean.filepath }</a>


</c:if>
</div>
<hr>
<div id="boardcont_menu" style="margin-left:80%">
		<a href="communityedit"><input type="button" value="수정" class="btn"></a>
		<a href="communitydel"><input type="button" value="삭제" class="btn"></a>
		<input type="button" value="답변" class="btn" onclick="location='communityreply'">
		<input type="button" value="목록" class="btn" onclick="location='communitylist?page=${page}'">
		</div>
</div>
</body>
</html>