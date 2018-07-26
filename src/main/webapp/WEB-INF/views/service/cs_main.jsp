<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
	<script src="/donong/resources/service/js/cs_main.js"></script>
	
	<link rel="stylesheet" type="text/css" href="/donong/resources/service/css/cs_main.css">
</head>
<body>
		<a href="/donong/cs/main">main</a>
		<a href="/donong/cs/notice">notice</a>
		<a href="/donong/cs/qna">qna</a>
	<div id="cs">
	
		<div id="cs_header">
			<span>Donong</span>&nbsp; <span>고객센터</span> <span>고객님과 함께하는 Donong 고객센터입니다.</span>
		</div>
			
		<div id="faqSrcBar">
			<form action="/donong/cs/faq" method="get">
				<label id="faqLabel"><span>FAQ</span> 검색</label>
				<div id="col2">
					<div id="col2-row1">검색을 이용하시면 보다 빠르게 원하시는 답변을 얻으실 수 있습니다.</div>
					<input type="text" id="keyword" name="keyword" placeholder=" 검색 후 문의가 해결되지 않으면 1:1 상담을 이용하세요." />
					<input type="submit" value="검색" />
				</div>
				<div id="col3">
					<input type="button" id="qnaBtn" value="1:1 상담하기" onclick="location.href='/donong/cs/qna'" />
				</div>
			</form>
		</div>
		
		<div id="quickMenu">
			<div id="quickMenu_header">
				<span>Quick</span>&nbsp;<span>FAQ</span>&nbsp;<span>FAQ 주요키워드 입니다.</span>
			</div>

			<table class="faqBox">
				<thead>
					<tr>
						<th class="first" scope="col"><p>회원/정보관리</p></th>
						<th scope="col"><p>주문/결제</p></th>
						<th scope="col"><p>배송</p></th>
						<th scope="col"><p>취소/환불</p></th>
						<th scope="col"><p>반품/교환/AS</p></th>
						<th scope="col"><p>나의Donong</p></th>
						<th scope="col"><p>기타</p></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="first"><div>
								<p>
									<a href="/donong/cs/faq?keyword=본인인증">본인인증</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=개인정보">개인정보</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=비회원">비회원</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=탈퇴">탈퇴</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=인증">인증</a>
								</p>
							</div></td>
						<td><div>
								<p>
									<a href="/donong/cs/faq?keyword=SNS 간편 주문">SNS 간편 주문</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=DonongPay">DonongPay</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=PAYCO">PAYCO</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=결제">결제</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=문화상품권">문화상품권</a>
								</p>
							</div></td>
						<td><div>
								<p>
									<a href="/donong/cs/faq?keyword=수취확인">수취확인</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=자동 수취확인">자동 수취확인</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=CU 픽업">CU 픽업</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=배송지연">배송지연</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=배송">배송</a>
								</p>
							</div></td>
						<td><div>
								<p>
									<a href="/donong/cs/faq?keyword=환불">환불</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=취소">취소</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=주문취소">주문취소</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=환불기간">환불기간</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=환불계좌">환불계좌</a>
								</p>
							</div></td>
						<td><div>
								<p>
									<a href="/donong/cs/faq?keyword=CU 반품">CU 반품</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=반품">반품</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=교환">교환</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=반품보류">반품보류</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=반품신청">반품신청</a>
								</p>
							</div></td>
						<td><div>
								<p>
									<a href="/donong/cs/faq?keyword=Donong캐쉬백 전환">Donong캐쉬백 전환</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=Donong캐쉬백 통합">Donong캐쉬백 통합</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=Donong멤버십혜택">Donong멤버십혜택</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=Donong멤버십할인">Donong멤버십할인</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=쿠폰사용">쿠폰사용</a>
								</p>
							</div></td>
						<td><div>
								<p>
									<a href="/donong/cs/faq?keyword=티켓Donong">티켓Donong</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=Donong*상담메신저">Donong*상담메신저</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=Donong*">Donong*</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=세금계산서">세금계산서</a>
								</p>
								<p>
									<a href="/donong/cs/faq?keyword=영수증">영수증</a>
								</p>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div id="listSection">
			
			<table id="faqList">
				<tr>
					<th colspan="3">자주 묻는 질문 TOP 10</th>
				</tr>
				<c:set var="num" value="1"/>
				<c:forEach var="content" items="${faqList }">
					<tr>
						<td width="10%">
							❁ ${num }
							<c:set var="num" value="${num + 1 }" />
						</td>
						<td width="90%">
							<div>
								<a href="/donong/cs/faq?keyword=${content.title }">
									${content.title } 
								</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<table id="noticeList">
				<tr>
					<th colspan="3">공지사항</th>
				</tr>
				<c:forEach var="content" items="${noticeList }">
					<tr>
						<td width="10%">
							❁
						</td>
						<td width="73%">
							<div>
								<a href="./notice/${content.num }?state=cont">
									${content.title } 
								</a>
							</div>
						</td>
						<td width="17%">${content.regitdate }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		
		
	</div>
	
</body>
</html>
