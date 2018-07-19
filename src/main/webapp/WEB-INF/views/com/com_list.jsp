<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="resources/js/jquery-3.3.1.js"></script>
<script>
$(function(){
	var limit; 
	var search_index;
	var text;
	
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
  <div class="container">
  <div style="text-align:center; font-size:150px; top-margin:50px;">
   <a href ="communitylist?page=1&category=전체"><input type="button" value="전체" class="btn btn-lg"></a>
   <a href ="communitylist?page=1&category=잡담"><input type="button" value="잡담" class="btn btn-lg" ></a>
   <a href ="communitylist?page=1&category=질문"><input type="button" value="질문" class="btn btn-lg" ></a>
   <a href ="communitylist?page=1&category=정보"><input type="button" value="정보" class="btn btn-lg" ></a>
   <a href ="communitylist?page=1&category=모임"><input type="button" value="모임" class="btn btn-lg" ></a>
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
             <img src="./resources/images/AnswerLine.gif"> 
             </c:if>   
             
             <a href = "communitycont?com_num=${b.num}&page=${page}&state=cont">
                      ${b.subject}
             </a>
          </div>
       </td>
       <td>
          <div>${b.writer}</div>
       </td>
       <td>
          <div>${b.regitdate}</div>
       </td>
       <td>
          <div>${b.readcount}</div>
       </td>
    </tr>
    
    </c:forEach>
    <tr class = "pagination">
       <td colspan = 5>
          <c:if test = "${page <= 1}">
             &lt;&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "communitylist?page=${page-1}">&lt;</a>&nbsp;   
          </c:if>
          
          <c:forEach var = "a" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${a == page}">
                ${a}
             </c:if>
             <c:if test = "${a != page}">
                <a href = "communitylist?page=${a}">${a}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;&gt;
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "communitylist?page=${page + 1}">&nbsp;&gt;</a>
          </c:if>
       </td>                  
    </tr>
    
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
     
    <form method="get" action="communityfind" onsubmit="return find_check()">
    
    <table>
   
    <tr>
    
    <th>
    <div class="form-control">
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
    <form method="get" action="./communitywrite">
    <table id="table_third">
	
	<tr><td>
			<button type="submit" class="btn" >글쓰기</button>
	</td>
	</tr>
</table>
</form>
</div>
</body>

</html>