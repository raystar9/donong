<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/common/jsp/import.jsp" %>
<title>나만따라와 도시농부</title>
<!--  <script src="resources/js/bbs.js"></script>-->
<script>
function check(){
	if($.trim($('#category').val())==""){
		alert('카테고리를 선택하세요.');
		$('#category').focus();
		return false;
	}
	if($.trim($('#subject').val())==""){
		alert('제목을 입력하세요.');
		$('#subject').focus();
		return false;
	}
	if($.trim($('#content').val())==""){
		alert('내용을 이력하세요.');
		$('#content').focus();
		return false;
	}
}
$(document).ready(function(){
	$("#update").on("click",function(e){
		$("#update-form").css("display","inline");
	});
	$("#delete").on("click",function(e){
		var url="/donong/community/deleteFile?fileName=${bbsbean.filepath }&directory=community&num=${bbsbean.num}";
		window.open(url,"","width=300,height=150,left=300");
	});
});

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<h2 class="comwrite_title">커뮤니티게시판 수정</h2>
		<form method="post" action="edit_ok" onsubmit="return check()" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${num}">
			<input type="hidden" name="page" value="${page}">
			<table id="comwrite_t">
			
			<%--
				<tr>
					<th>글쓴이</th>
					<td><input name="com_name" id="com_name" size="14"
						class="input_box" value="${bbsbean.com_name }"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="com_pass" id="com_pass"
						size="14" class="input_box"></td>
				</tr>
				 --%>
				<tr class="form-group"> 
					<th class="well well-sm" style="text-align:center;">제목</th>
					<td><input name="subject" id="subject" size="40"
						class="form-control" value="${bbsbean.subject }"><input type="hidden" name="writer" id="writer" size="14"
						class="input_box" value="${sessionBean.nickname}"><input type="hidden" name="member_num" id="member_num" value="${sessionBean.memberNum}"
						size="14" class="input_box"></td>
				</tr>
				<tr>
				<th class="well well-sm" style="text-align:center;">파일 첨부</th>
				<td>
				<c:if test="${bbsbean.filename == null}">
					<label for="upfile"></label>
					<input type="file" name="uploadfile" class="form-control" />
					<span id="filevalue"></span>
				</c:if>
				<c:if test="${bbsbean.filename != null}">
					<div id="update-form" >
					<label for="upfile"></label>
						<input type="file" name="uploadfile" class="form-control" style="width:88%;float:left;" />
						<a  style="float:left;" id="delete" name="delete" class="btn btn-danger">삭제</a>
						<span id="filevalue"></span>
					</div>
				</c:if>
				
				</td>
				</tr>
				<tr>
				
				<th class="well well-sm" style="text-align:center;">분류</th>
				<td>
				<input name="category" id="category" value="${bbsbean.category }" class="form-control" readonly>
				</td>
				
				</tr>
				<tr>
					<th  class="well well-sm" style="text-align:center;">글내용</th>
					<td><textarea name="content" id="content" rows="15"
							cols="120" class="form-control">${bbsbean.content}</textarea></td>
				</tr>
				
			</table>
			<br>
			<div class="form-group">
				<input type="submit" value="수정" class="btn btn-lg"> <input
					type="reset" value="취소" class="btn btn-lg"
					onclick="$('#subject').focus();">
			</div>
		</form>
	</div>
</body>
</html>