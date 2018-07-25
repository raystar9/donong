<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>My Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
 
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
     text-align:center;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
  
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>
  <%@include file="../header.jsp" %>
  
<div class="container">
	<div class="col-sm-2"></div>
    <div class="col-sm-8">
      <h4>최근에 작성한 글</h4>
      <ul class="nav nav-pills nav-stacked">
        <li><a href="#">작성글1</a></li>
        <li><a href="#">작성글2</a></li>
        <li><a href="#">작성글3</a></li>
        <li><a href="#">작성글4</a></li>
        <li><a href="#">작성글5</a></li>
      </ul><br>
      <div class="input-group">

      </div>
    </div>

    <div class="col-sm-2"></div>
</div>

<footer class="container-footer">
	<input type="button" value="정보수정"  class="btn btn-default" onclick="location='member_edit'">
	<input type="button" value="내가 한 질문"  class="btn btn-default" onclick="location='member_del'">
	<input type="button" value="회원탈퇴"  class="btn btn-default" onclick="location='member_del'">
</footer>

</body>
</html>
