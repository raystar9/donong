<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${listcount ==0 }">
	<tr>
		<td colspan="4">MVC 게시판</td>
		<td style="text-align:right">
			<font size=2>등록된 글이 없습니다.</font>
		</td>
	</tr>
</c:if>

<!-- 레코드가 있으면 -->
<c:if test="${listcount !=0 }">
	<tr>
		<th colspan="3">MVC 게시판 - list</th>
		<th colspan="2">
			<font size=2>글 개수 : ${listcount}</font>
		</th>
	</tr>
	<tr>
	<th width="8%"><div>번호</div></th>
	<th width="50%"><div>제목</div></th>
	<th width="14%"><div>작성자</div></th>
	<th width="17%"><div>날짜</div></th>
	<th width="11%"><div>조회수</div></th>
	</tr>
	
<c:set var="num" value="${listcount-(page-1)*limit}"/>
<c:forEach var="list" items="${bbslist}">
	<tr>
		<td>
			<c:out value="${num}"/><%-- num 출력 --%>
			<c:set var="num" value="${num-1}"/> <%-- num = num-1 --%>
		</td>
		<td>
			<div>
				<%-- 답변글 제목앞에 여백 처리 부분
					bbs_RE_LEV, bbs_RE_LEV, bbs_NUM,
					bbs_SUBJECT, bbs_NAME, bbs_DATE,
					bbs_READCOUNT : property 이름 --%>
				<c:if test="${list.bbs_re_lev !=0}">
				<!-- 답글인 경우 -->
					<c:forEach var="a" begin="0" end="${list.bbs_re_lev*2}" step="1">
					&nbsp;
					</c:forEach>
				<img src=./resources/images/AnswerLine.gif>
				<a href="./bbs_cont.nhn?num=${list.bbs_num}&page=${page}&state=cont">
				${list.bbs_subject}</a>
				</c:if>
				</div>
				<div>
				<c:if test="${list.bbs_re_lev ==0}">
				<!-- 원문인 경우 -->
				&nbsp; <img src=./resources/images/AnswerLine.gif>
				<a href="./bbs_cont.nhn?num=${list.bbs_num}&page=${page}&state=cont">
				${list.bbs_subject}</a>
				</c:if>
				
			</div>
		</td>	
		
			
		<td><div>${list.bbs_name}</div></td>
		<td><div>${list.bbs_date}</div></td>
		<td><div>${list.bbs_readcount}</div></td>
	</tr>
	</c:forEach>
	
	<tr class="h30 lime center btn">
		<td colspan="5">
			<c:if test="${page<=1}">
				이전&nbsp;
			</c:if>
			<c:if test="${page>1}">
				<a href="./bbs_list.nhn?page=${page-1}">이전</a>
			</c:if>
			
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a==page}">
					${a}
				</c:if>
				<c:if test="${a!=page}">
				<a href="./bbs_list.nhn?page=${a}">${a}</a>
				</c:if>
			</c:forEach>

			<c:if test="${page>=maxpage}">
				다음&nbsp;
			</c:if>
			<c:if test="${page<maxpage}">
				<a href="./bbs_list.nhn?page=${page+1}">다음</a>
			</c:if>
		</td>		
	</tr>
</c:if>
	