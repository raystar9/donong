<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/common/jsp/import.jsp" %>
<title>Insert title here</title>
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
		alert('내용을 입력하세요.');
		$('#content').focus();
		return false;
	}
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<h2 class="comwrite_title">커뮤니티 게시판 글쓰기</h2>
		<form method="post" action="communitywrite_ok" onsubmit="return check()"
		      enctype="multipart/form-data">
			<table id="comwrite_t">
				<!-- 
				<tr>
					<th>글쓴이</th>
					<td></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td></td>
				</tr>
				 -->
				
				<tr class="form-group">
					<th class="well well-sm" style="text-align:center;">제목</th>
					<td><input name="subject" id="subject"
						class="form-control"> <input type="hidden" name="writer" id="writer" size="14"
						class="input_box" value="${sessionBean.nickname}"><input type="hidden" name="member_num" id="member_num" value="${sessionBean.memberNum}"
						size="14" class="input_box"></td>
						
				</tr>
				
				<tr>
				<th class="well well-sm" style="text-align:center;">파일 첨부</th>
				<td>
				<label for="upfile"></label>
				<input type="file" id="filename" name="uploadfile" value=" " class="form-control">
				<span id="filevalue"></span>
				</td>
				</tr>
				<tr>
				<th class="well well-sm" style="text-align:center;">분류</th>
				<td>
				<select class="form-control" name="category" id="category">
					<option value="">선택하세요.</option>
				<option value="잡담">잡담</option>
				<option value="질문">질문</option>
				<option value="정보">정보</option>
				<option value="모임">모임</option>
				</select>
				
				</td>
				</tr>
				<tr>
					<th class="well well-sm" style="text-align:center;">글내용</th>
					<td ><textarea name="content" id="content" rows="15"
							cols="60" class="form-control"></textarea></td>
				</tr>
				
			</table>
			<br>
			<div class="form-group">
				<input type="submit" value="글쓰기" class="btn btn-lg"> <input
					type="reset" value="취소" class="btn btn-lg"
					onclick="$('#subject').focus();">
			</div>
		</form>
	</div>
</body>
</html>