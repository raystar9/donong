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
<img src="resources/upload${bbsbean.filename }">
</c:if>
<br>
		${content}
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
<div id="boardcont_menu" style="margin-left:75%">
		
		<input type="button" value="수정" class="btn" onclick="location='communityedit?page=${page}&num=${num}'">
		<input type="button" value="삭제" class="btn" onclick="location='communitydel?num=${num}'">
		<input type="button" value="답변" class="btn" onclick="location='communityreply?page=${page}&num=${num}'">
		<input type="button" value="목록" class="btn" onclick="location='communitylist?page=${page}'">
		</div>
</div>
</body>
</html>