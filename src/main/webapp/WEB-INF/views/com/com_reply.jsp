<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<script src="resources/js/bbs.js"></script>
<link href="resources/css/bbs.css" rel="stylesheet">
</head>
<body>
<c:set var="boarddata" value="${bbsbean}"/>
	<div id="bbswrite_wrap">
		<h2 class="bbswrite_title">답변 입력폼</h2>

		<form method="post" action="./bbs_reply.nhn">
							<input type="hidden" name="bbs_num" value="${boarddata.bbs_num}">

<input type="hidden" name="bbs_re_ref" value="${boarddata.bbs_re_ref}">
<input type="hidden" name="bbs_re_lev" value="${boarddata.bbs_re_lev}">
<input type="hidden" name="bbs_re_seq" value="${boarddata.bbs_re_seq}">
<input type="hidden" name="page" value="${page }">
			<table id="boardreply_t">

				<tr>
					<th>글쓴이</th>
					<td><input name="bbs_name" id="bbs_name" size="14" ></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="bbs_pass" id="bbs_pass"
						size="14" class="input_box"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input name="bbs_subject" id="bbs_subject" size="40"
						class="input_box" value="re:${bbsbean.bbs_subject }"></td>
				</tr>
				<tr>
					<th>글내용</th>
					<td><textarea name="bbs_content" id="bbs_content" rows="8"
							cols="50" class="input_box"></textarea></td>
				</tr>
			</table>
			<div id="boardreply_menu">
				<input type="submit" value="등록" class="input_button"> <input
					type="reset" value="취소" class="input_button"
					onclick="$('#bbs_name').focus();">
			</div>
		</form>
	</div>
</body>
</html>