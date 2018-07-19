<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<html>
<head>
<title>회원 정보 수정 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//도로명 주소찾기 API


function Postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
           
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                /*      
                //1차 주소값에 ()안에 동을 추가 하고 싶을 경우 주석 제거
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
           */
 
             // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                
             
            } 
                
           

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postno').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addrdetail').focus();
        }
    }).open();
    
}

function domain_list(){
	if($("#mail_list").val()=="0"){
		//@뒤의 도메인 입력란 공백처리
		$("#join_maildomain").val("");
		//@뒤의 도메인입력란을 쓰기 가능
		$("#join_maildomain").attr("readOnly",false);
		//도메인 입력란으로 입력 대기 상태
		$("#join_maildomain").focus();
	} else {
	
		$("#join_maildomain").val($("#mail_list").val());
		$("#join_maildomain").attr("readOnly", true);
	}
}

function check(){
	
	//도메인 주소값 유효성검사
	if($.trim($("#join_maildomain").val())==""){
		alert("도메인주소를 선택하세요");
		$("#join_id").val("").focus();
		return false;
	}
	
	//비밀번호 일치여부 확인
	if($.trim($("#join_pwd").val())!=$.trim($("#join_passchk").val())){
		alert("비밀번호를 다시 확인하세요");
		$("#join_pwd").val("").focus();
		$("#join_passchk").val("").focus();
		return false;
	}
	
	
	alert($('#join_nickname').val()+" 님의 정보가 수정되었습니다.")
		
	
}



</script>
</head>
<body>
	<form name="joinform" method="post" action="member_edit_ok"  onsubmit="return check()">
		<table id="join_table">
			<tr>
				<th>ID</th>
				<td>
					<input name="id" id="join_id" size="30" class="input_box" placeholder="입력 후 중복체크를 해주세요" value="${memberDTO.id }"  readonly><!-- ID 입력 칸 -->
           			<input type="button" value="아이디 중복체크" class="input_button"> <!-- 중복체크 버튼 -->
           			<div id="idcheck"></div> <!-- 중복체크 결과 표시칸 -->
                </td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="password" id="join_pwd" size="40" class="input_box" required>
				</td>
			</tr>	
			<tr>
				<th>비밀번호확인</th>
				<td>
					<input type="password" name="join_passchk" id="join_passchk" size="40" class="input_box" required>
				</td>
			</tr>	
			
			<tr>
				<th>별칭</th>
				<td>
					<input name="nickname" id="join_nickname" size="40" class="input_box" placeholder="사이트 내에서 사용될 별칭입니다." required value="${memberDTO.nickname }">
				</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>
					<input name="realname" id="join_name" size="40" class="input_box" readonly required value="${memberDTO.realname }">
				</td>
			</tr>	
			<tr>
				<th>우편번호</th>
					<td>
						<input type="text" id="postno" name="postnum" readonly value="${memberDTO.postnum}">
						<input type="button"  value="주소검색" onclick="Postcode()">
					</td>
				</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="addr" name="address" size="50" required value="${memberDTO.address}"></td>
			</tr>
				<tr>
					<th>상세주소</th>
					<td>
						<input type="text" id="addrdetail" name="addressdetail" value="${memberDTO.addressdetail}">
					</td>
					
				</tr>
				
			<tr>
				<th>휴대전화번호</th>
				<td>
					<input name="phone" id="join_phone" size="30" class="input_box" placeholder="하이픈(-) 없이 입력해주세요" required value="${memberDTO.phone }">
				</td>
			</tr>
			<tr>
				<th>전자우편</th>
				<td>
					<input name="email" id="join_mailid" size="10" class="input_box"  value="${memberDTO.email}" required>
					@<input name="emaildomain" id="join_maildomain" size="20" class="input_box" readonly value="${memberDTO.emaildomain}" >
						<select name="mail_list" id="mail_list" onchange="domain_list()">
							<option value="">도메인선택</option>
							<option value="daum.net" <c:if test="${memberDTO.emaildomain == 'daum.net'}">selected</c:if>>daum.net</option>
							<option value="nate.com" <c:if test="${memberDTO.emaildomain == 'nate.com'}">selected</c:if>>nate.com</option>
							<option value="naver.com" <c:if test="${memberDTO.emaildomain == 'naver.com'}">selected</c:if>>naver.com</option>
							<option value="hotmail.com" <c:if test="${memberDTO.emaildomain == 'hotmail.com'}">selected</c:if>>hotmail.com</option>
							<option value="gmail.com" <c:if test="${memberDTO.emaildomain == 'gmail.com'}">selected</c:if>>gmail.com</option>
							<option value="0">직접입력</option>
						</select>

				</td>		
				
			</tr>
		</table>
			<div id="join_menu">
					<input type="submit" value="회원정보수정" class="input_button">
					<input type="reset" value="초기화" class="input_button" onclick="$('#join_id').focus();">
			</div>	
	</form>

</body>
</html>
