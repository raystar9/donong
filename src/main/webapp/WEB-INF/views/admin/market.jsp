<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/resources/common/jsp/import.jsp" %>
	<meta charset="utf-8">
	<title>Home</title>
	<style>
	.main {
		margin-top: 50px;
	}
	.market-table-width{
		max-width: 800px;
		margin: auto;
	}
	.market-nav {
		margin-bottom: 5px;
	}
	.market-nav>li>a {
		border: 1px solid white;
	} 
	.market-table th, .market-table td {
		text-align: center;
	}
	</style>
	<script>
		
	function showDefaultTable() {
		$.ajax({
			url: "/donong/admin/market/waiting",
			method: "get",
			success: result=>{
				$(".market-table").html(result);
				$(".market-nav>li").removeClass("active");
				$("#waiting").addClass("active");
				$(".market-submit").show().val("입금 확인");
				$(".market-form").off().submit(e=>{
					e.preventDefault();
					$.ajax({
						url: "/donong/admin/market/preparing",
						method: "post",
						data: $(".market-form").serialize(),
						success: ()=>{
							alert("젼송 완료");
							showDefaultTable();
						},
						error: ()=>{
							alert("오류가 발생했습니다.");
						}
					});
				});
			},
			error: ()=>{
				alert("오류가 발생했습니다.");
			}
		})
	}
	
	$().ready(function() {
		$("#waiting>a").click(showDefaultTable);
		
		$("#preparing>a").click(function showPrepareTable() {
			$.ajax({
				url: "/donong/admin/market/preparing",
				method: "get",
				success: result=>{
					$(".market-table").html(result);
					$(".market-nav>li").removeClass("active");
					$("#preparing").addClass("active");
					$(".market-submit").show().val("배송하기");
					$(".market-form").off().submit(e=>{
						e.preventDefault();
						$.ajax({
							url: "/donong/admin/market/sending",
							method: "put",
							data: $(".market-form").serialize(),
							success: ()=>{
								alert("젼송 완료");
								showPrepareTable();
							},
							error: ()=>{
								alert("오류가 발생했습니다.");
							}
						});
					});
				},
				error: ()=>{
					alert("오류가 발생했습니다.");
				}
			})
		});
		
		$("#sending>a").click(function showSendTable() {
			$.ajax({
				url: "/donong/admin/market/sending",
				method: "get",
				success: result=>{
					$(".market-table").html(result);
					$(".market-nav>li").removeClass("active");
					$("#sending").addClass("active");
					$(".market-submit").show().val("수취 확인");
					$(".market-form").off().submit(e=>{
						e.preventDefault();
						$.ajax({
							url: "/donong/admin/market/arrived",
							method: "put",
							data: $(".market-form").serialize(),
							success: ()=>{
								alert("젼송 완료");
								showSendTable();
							},
							error: ()=>{
								alert("오류가 발생했습니다.");
							}
						});
					});
				},
				error: ()=>{
					alert("오류가 발생했습니다.");
				}
			})
		});
		
		$("#arrived>a").click(function() {
			$.ajax({
				url: "/donong/admin/market/arrived",
				method: "get",
				success: (result)=>{
					$(".market-table").html(result);
					$(".market-nav>li").removeClass("active");
					$("#arrived").addClass("active");
					$(".market-submit").hide();
				},
				error: ()=>{
					alert("오류가 발생했습니다.");
				}
			})
		});
		showDefaultTable();
	});
		
	</script>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="main">
<div class="container">
<ul class="nav nav-tabs nav-justified market-nav market-table-width">
  <li class="active" id="waiting"><a href="#">입금대기</a></li>
  <li id="preparing"><a href="#">배송준비</a></li>
  <li id="sending"><a href="#">배송중</a></li>
  <li id="arrived"><a href="#">배송완료</a></li>
</ul>
<form class="market-form">
<table class="table market-table market-table-width"></table>
<div class="col-sm-9"></div>
<div class="col-sm-3">
<input class="btn btn-default market-submit" type="submit" value="입금 확인" />
</div>
</form>
</div>
</div>
</body>
</html>
