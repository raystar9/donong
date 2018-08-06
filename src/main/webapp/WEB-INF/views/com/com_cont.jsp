<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/common/jsp/import.jsp" %>
<script>

$(document).ready(function(){
	
	listReply();//json 리턴방식

	//댓글 쓰기 버튼 클릭 이벤트
	$("#btnReply").click(function(){
		$.ajax({
			type:"post",
			url:"/donong/reply/insert.do",
			data:{
				contents: $("#replytext").val(),
				communityNum: "${bbsbean.num}"
			},
			success:function(){
				alert("댓글이 등록되었습니다.");
				listReply();
			}
		});
		
	});
});
//Controller방식
function listReply(){
	$.ajax({
		type:"get",
		url:"/donong/reply/list.do?num=${bbsbean.num}",
		success:function(result){
			$("#listReply").html(result);
		}		
	});
	
}

function showReplyModify(num){
	$.ajax({
		type:"get",
		url:"/donong/reply/detail/"+num,
		success:function(result){
			$("#modifyReply").html(result);
			$("#modifyReply").css("visibility","visible");
		}
	});
}
function listReplyRest(num){
	$.ajax({
		type:"get",
		url:"/donong/reply/list.do?num=${bbsbean.num}",
		success:function(result){
			$("#listReply").html(result);
		}
	});
}
</script>
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
	<h5>글쓴이 ${bbsbean.writer} <fmt:formatDate value="${bbsbean.regitdate}" pattern="yyyy-MM-dd HH:mm:SS"></fmt:formatDate> 조회 ${bbsbean.readcount }</h5>
	<hr>
		<div class="container">
		<div class="col-sm-9" style="float:left;">
		<c:if test="${!empty bbsbean.filename }">
<img src="displayFile?fileName=${bbsbean.filepath }&directory=community" alt="이상이상" />
</c:if>
<br>
		${content}
<br>

</div>
<div class="col-sm-3" >
		<input type="button" value="목록" class="btn" style="vertical-align: top,right;float:right;" onclick="location='list?page=${page}'">
	</div>
	</div>
	<hr>
	<c:if test="${!empty bbsbean.filename }">
	
	<form action="/donong/community/download" method="get">
		<input type="hidden" name="directory" value="community" />
		<input type="hidden" name="fileName" value="${bbsbean.filepath}" />
		<input type="submit" value="파일다운로드" class="btn btn-success" />
	</form>

</c:if>
</div>
<hr>
<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성해주세요"></textarea>
<br>
<button type="button" id="btnReply" class="btn">댓글 작성</button>
<div id="listReply"></div>
<hr>
<div id="boardcont_menu" style="margin-left:75%">
		<c:if test="${sessionBean.memberNum== bbsbean.member_num }">
		<input type="button" value="수정" class="btn" onclick="location='edit?page=${page}&num=${num}'">
		<input type="button" value="삭제" class="btn" onclick="location='del?num=${num}'">
		</c:if>
		<input type="button" value="답변" class="btn" onclick="location='reply?page=${page}&num=${num}'">
		<input type="button" value="목록" class="btn" onclick="location='list?page=${page}'">
		</div>
</div>

</body>
</html>