<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/common/jsp/import.jsp" %>
<title>Insert title here</title>
<script>
$(function(){
	var limit; 
	var search_index;
	var text;
	console.log('page = ${page}');
	console.log('startpage = ${startpage}');
	console.log('endpage = ${endpage}');
	$("#viewcount").change(function(){
		limit = $("#viewcount option:selected").val();
		
		$.ajax({
			type : "POST",
			data : {"limit" : limit, "state":"ajax"},
			url : "./communitylist",
			cache:false,
			headers : {"cache-control" : "no-cache",
						"pragma" : "no-cache"},
			success : function(data){
				//alert(data);
				$("#list_table").empty().prepend(data);
			},
			error : function(){
				alert("에러");
			}
		})
	})
	
	$("#viewcount").val("${limit}").attr('selected','selected');
	
/* 	
	$("#search").submit(function(){
		var search_index = $("#search_index option:selected").val();
		var text = $("#search_text").val();
		
		$.ajax({
			type : "post",
			data : {"search_index" : search_index, "text" : text},
			url : "./bbs_list.nhn",
			headers : {"cache-control" : "no-cache",
				"pragma" : "no-cache"},
			success : function(data){
				$("#list_table").empty().prepend(data);
			},
			error : function(){
				alert("에러");
			}
		})
		$("#search_index").val(search_index).attr('selected','selected');
		$("#search_text").val(text);
	}) */
	
	
})
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
  <div class="container">
  <div style="text-align:center; font-size:150px; top-margin:50px;">
   <a href ="list?page=1&category=전체"><input type="button" value="전체" class="btn btn-lg"></a>
   <a href ="list?page=1&category=잡담"><input type="button" value="잡담" class="btn btn-lg" ></a>
   <a href ="list?page=1&category=질문"><input type="button" value="질문" class="btn btn-lg" ></a>
   <a href ="list?page=1&category=정보"><input type="button" value="정보" class="btn btn-lg" ></a>
   <a href ="list?page=1&category=모임"><input type="button" value="모임" class="btn btn-lg" ></a>
    </div>
    <table class="table table-hover">
       
    <tr>
    <th width = "10%"><div>분류</div></th>
       <th width = "48%"><div>제목</div></th>
       <th width = "12%"><div>작성자</div></th>
       <th width = "15%"><div>날짜</div></th>
       <th width = "9%"><div>조회수</div></th>
    
    </tr>
    <c:set var = "num" value = "${listcount-(page-1)*10}"/>
    <c:forEach var = "b" items = "${boardList}">
    <tr>
       <td>
<div>${b.category}</div>
       </td>
       <td>
          <div>
             <c:if test = "${b.re_lev != 0}">
                <c:forEach var = "a" begin = "0" end = "${b.re_lev*2}" step = "1">
                &nbsp;
                </c:forEach>
             
             </c:if>   
             
             <a href = "cont?num=${b.num}&page=${page}">
                      ${b.subject}
             </a>
          </div>
       </td>
       <td>
          <div>
          <c:if test="${b.writer=='admin'}">
          <b>${b.writer}</b></c:if>
          <c:if test="${b.writer!='admin' }">
          ${b.writer}</c:if>
          </div>
       </td>
       <td>
          <div><fmt:formatDate value="${b.regitdate}" pattern="yyyy-MM-dd HH:mm:SS"></fmt:formatDate></div>
       </td>
       <td>
          <div>${b.readcount}</div>
       </td>
    </tr>
    
    </c:forEach>
    <c:if test="${category=='전체' }">
    <tr class = "pagination">
       <td >
          <c:if test = "${page <= 1}">
             &lt;&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "list?page=${page-1}">&lt;</a>&nbsp;   
          </c:if>
          
          <c:forEach varStatus = "status" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${status.index == page}">
                ${status.index}
             </c:if>
             <c:if test = "${status.index != page}">
                <a href = "list?page=${status.index}">${status.index}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;&gt;
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "list?page=${page + 1}">&nbsp;&gt;</a>
          </c:if>
       </td>                  
    </tr>
    </c:if>
    <c:if test="${category=='잡담' }">
      <tr class = "pagination">
       <td >
          <c:if test = "${page <= 1}">
             &lt;&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "list?page=${page-1}&category=잡담">&lt;</a>&nbsp;   
          </c:if>
          
          <c:forEach varStatus = "status" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${status.index == page}">
                ${status.index}
             </c:if>
             <c:if test = "${status.index != page}">
                <a href = "list?page=${status.index}&category=잡담">${status.index}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;&gt;
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "list?page=${page + 1}&category=잡담">&nbsp;&gt;</a>
          </c:if>
       </td>                  
    </tr>
    </c:if>
    <c:if test="${category=='질문' }">
      <tr class = "pagination">
       <td >
          <c:if test = "${page <= 1}">
             &lt;&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "list?page=${page-1}&category=질문">&lt;</a>&nbsp;   
          </c:if>
          
          <c:forEach varStatus = "status" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${status.index == page}">
                ${status.index}
             </c:if>
             <c:if test = "${status.index != page}">
                <a href = "list?page=${status.index}&category=질문">${status.index}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;&gt;
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "list?page=${page + 1}&category=질문">&nbsp;&gt;</a>
          </c:if>
       </td>                  
    </tr>
    </c:if>
    <c:if test="${category=='정보' }">
      <tr class = "pagination">
       <td >
          <c:if test = "${page <= 1}">
             &lt;&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "list?page=${page-1}&category=정보">&lt;</a>&nbsp;   
          </c:if>
          
          <c:forEach varStatus = "status" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${status.index == page}">
                ${status.index}
             </c:if>
             <c:if test = "${status.index != page}">
                <a href = "list?page=${status.index}&category=정보">${status.index}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;&gt;
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "list?page=${page + 1}&category=정보">&nbsp;&gt;</a>
          </c:if>
       </td>                  
    </tr>
    </c:if>
    <c:if test="${category=='모임' }">
      <tr class = "pagination">
       <td >
          <c:if test = "${page <= 1}">
             &lt;&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "list?page=${page-1}&category=모임">&lt;</a>&nbsp;   
          </c:if>
          
          <c:forEach varStatus = "status" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${status.index == page}">
                ${status.index}
             </c:if>
             <c:if test = "${status.index != page}">
                <a href = "list?page=${status.index}&category=모임">${status.index}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;&gt;
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "list?page=${page + 1}&category=모임">&nbsp;&gt;</a>
          </c:if>
       </td>                  
    </tr>
    </c:if>
   
    <!-- 레코드가 없으면 -->
    <c:if test="${listcount == 0 }">
       <tr>
          <td colspan="4">커뮤니티 게시판</td>
          <td style = "text-align:right">
             <font size = 2>등록된 글이 없습니다.</font>
          </td>   
       </tr>
    </c:if>
      
       
    </table>
    <div id="bbsfind">
     
    <form method="get" action="find" onsubmit="return find_check()" style="position:relative;left:30%">
    
    <table>
   
    <tr>
    
    <th>
    <div class="form-control" style="height:100%">
    <select name="find_field" >
    <option value="writer">작성자</option>
    <option value="subject">제목</option>
    <option value="content">내용</option>
    </select>
    
    <input name="find_name" id="find_name" ><input type="submit" value="검색" class="btn" >
    </div>
    </th>
    
    </tr>
   
    </table>
    
    </form>
    </div>
    
    <br>
    <form method="get" action="write" style="float:right;">
    <table id="table_third">
	<c:if test="${sessionBean.nickname != null}">
	<tr><td>
			<button type="submit" class="btn" style=>글쓰기</button>
	</td>
	</tr>
	</c:if>
</table>
</form>
</div>
</body>

</html>