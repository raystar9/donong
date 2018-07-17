<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="comcont_wrap" style="width:600px">
<h2 class="comcont_title" style="witdh:370px">
커뮤니티 게시판</h2>
<c:set var="boarddata" value="${boarddata}"/>
<table id="comcont_t" border='1'>
	<tr>
	<th colspan="2">${bbsbean.com_class }잡담|${bbsbean.com_subject}안녕하세요</th>
	<tr>
		<th colspan="2">글쓴이 
		${bbsbean.com_name}유승열 ${bbsbean.com_date}2018-07-16 조회 ${bbsbean.com_readcount }5</th>
	</tr>
	<tr>
		<th colspan="2">
		<textarea rows="8" cols="50" readonly>${com_cont}글의 내용을 담고있는 ....</textarea></th>
	</tr>
	<c:if test="${!empty bbsbean.com_file }">
	<tr>
	<th>첨부파일명</th>
	<td>
	<a href="./download.file?path=${bbsbean.com_file}&original=${bbsbean.com_original } ">${bbsbean.com_original }</a>
</td>
</tr>
</c:if>
</table>
<div id="boardcont_menu" style="margin-left:200px">
		<input type="button" value="수정" class="input_button" onclick="location='communitycont?com_num=${bbsbean.com_num}&page=${page}&state=edit'">
		<input type="button" value="삭제" class="input_button" onclick="location='communitycont?com_num=${bbsbean.com_num}&page=${page}&state=del'">
		<input type="button" value="답변" class="input_button" onclick="location='communitycont?com_num=${bbsbean.com_num}&page=${page}&state=reply'">
		<input type="button" value="목록" class="input_button" onclick="location='communitylist?page=${page}'">
		</div>
</div>
</body>
</html>