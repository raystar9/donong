<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <div style="text-align:center; font-size:150px; top-margin:50px;">
 <a href ="communitylist?page=1&category=전체"><input type="button" value="전체" class="btn btn-lg"></a>
   <a href ="communitylist?page=1&category=잡담"><input type="button" value="잡담" class="btn btn-lg" ></a>
   <a href ="communitylist?page=1&category=질문"><input type="button" value="질문" class="btn btn-lg" ></a>
   <a href ="communitylist?page=1&category=정보"><input type="button" value="정보" class="btn btn-lg" ></a>
   <a href ="communitylist?page=1&category=모임"><input type="button" value="모임" class="btn btn-lg" ></a>
      </div>
    <table class="table table-hover">
    <tr>
       <th width = "10"><div>분류</div></th>
       <th width = "48%"><div>제목</div></th>
       <th width = "12%"><div>작성자</div></th>
       <th width = "15%"><div>날짜</div></th>
       <th width = "9%"><div>조회수</div></th>
    </tr>
    <c:set var = "num" value = "${listcount-(page-1)*10}"/>
    <c:forEach var = "b" items = "${bbslist}">
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
             <a href = "communityfind?page=${page-1}&find_field=${find_field}&find_name=${find_name}">&lt;</a>&nbsp;   
          </c:if>
          
          <c:forEach varStatus = "status" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${status.index == page}">
                ${status.index}
             </c:if>
             <c:if test = "${status.index != page}">
                <a href = "communityfind?page=${status.index}&find_field=${find_field}&find_name=${find_name}">${status.index}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;&gt;
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "communityfind?page=${page + 1}&find_fielde=${find_field}&find_name=${find_name}">&nbsp;&gt;</a>
          </c:if>
       </td>                  
    </tr>
    
    <!-- 레코드가 없으면 -->
    <c:if test="${listcount == 0 }">
       <tr>
          <td colspan="4">커뮤니티</td>
          <td style = "text-align:right">
             <font size = 2>등록된 글이 없습니다.</font>
          </td>   
       </tr>
    </c:if>  
    </table>
    <div id="bbsfind">
    <script src="./resources/js/jquery.js"></script>
    <script>
    function find_check(){
    	if($.trim($("#find_name").val())==""){
    		alert("검색어를 입력하세요!");
    		$("#find_name").val("").focus();
    		return false;
    	}
    }
    </script>
    <form method="get" action="communityfind" onsubmit="return find_check()"  style="position:relative;left:30%">
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
    <form method="get" action="./communitywrite" style="float:right;">
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