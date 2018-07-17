<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <input type="button" value="전체">
   <input type="button" value="잡담">
   <input type="button" value="질문">
   <input type="button" value="정보">
   <input type="button" value="모임">
    <table>
    <tr>
       <th width = "8%"><div>분류</div></th>
       <th width = "50%"><div>제목</div></th>
       <th width = "14%"><div>작성자</div></th>
       <th width = "17%"><div>날짜</div></th>
       <th width = "11%"><div>조회수</div></th>
    </tr>
    <c:set var = "num" value = "${listcount-(page-1)*10}"/>
    <c:forEach var = "b" items = "${bbslist}">
    <tr>
       <td>
<div>${b.com_class}</div>
       </td>
       <td>
          <div>
             <c:if test = "${b.com_re_lev != 0}">
                <c:forEach var = "a" begin = "0" end = "${b.com_re_lev*2}" step = "1">
                &nbsp;
                </c:forEach>
             <img src="./resources/images/AnswerLine.gif"> 
             </c:if>   
             
             <a href = "communitycont?com_num=${b.com_num}&page=${page}&state=cont">
                      ${b.com_subject}
             </a>
          </div>
       </td>
       <td>
          <div>${b.com_name}</div>
       </td>
       <td>
          <div>${b.com_date}</div>
       </td>
       <td>
          <div>${b.com_readcount}</div>
       </td>
    </tr>
    
    </c:forEach>
    <tr class = "h30 lime center btn">
       <td colspan = 5>
          <c:if test = "${page <= 1}">
             이전&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "communitylist?page=${page-1}">이전</a>&nbsp;   
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
             &nbsp;다음
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "communitylist?page=${page + 1}">&nbsp;다음</a>
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
    <form method="get" action="communityfind" onsubmit="return find_check()">
    <table>
    <tr>
    <th>
    <select name="find_field">
    <option value="com_name">작성자</option>
    <option value="com_subject">제목</option>
    <option value="com_content">내용</option>
    </select>
    </th>
    <td>
    <input name="find_name" id="find_name" size="18" class="input_box">
    <input type="submit" value="검색" class="input_button">
    </td>
    </tr>
      <tr>
          <td style ="text-align:right">
             <a href = "./communitywrite">[글쓰기]</a>
          </td>   
       </tr>
    </table>
    </form>
    </div>
</body>

</html>