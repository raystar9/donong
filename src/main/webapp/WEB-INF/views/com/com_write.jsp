<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="resources/js/jquery-3.3.1.js"></script>
<!-- <script src="resources/js/bbs.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h2 class="comwrite_title">커뮤니티 게시판 글쓰기</h2>
		<form method="post" action="communitywrite_ok" onsubmit="return check()"
		      enctype="multipart/form-data">
			<table id="comwrite_t">
				<!-- 
				<tr>
					<th>글쓴이</th>
					<td><input type="hidden" name="com_name" id="com_name" size="14"
						class="input_box"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="hidden" name="com_pass" id="com_pass"
						size="14" class="input_box"></td>
				</tr>
				 -->
				<tr class="form-group">
					<th class="well well-sm" style="text-align:center;">제목</th>
					<td><input name="subject" id="subject"
						class="form-control"></td>
						
				</tr>
				
				<tr>
				<th class="well well-sm" style="text-align:center;">파일 첨부</th>
				<td>
				<label for="upfile"></label>
				<input type="file" id="upfile" name="uploadfile" value=" " class="form-control">
				<span id="filevalue"></span>
				</td>
				</tr>
				<tr>
				<th class="well well-sm" style="text-align:center;">분류</th>
				<td>
				<select class="form-control">
				<option>선택하세요.</option>
				<option>잡담</option>
				<option>질문</option>
				<option>정보</option>
				<option>모임</option>
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