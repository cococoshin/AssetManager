<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">   
   
	$(document).ready(function() { // 아이디 중복여부 확인
		$("#userid").on("keyup", function() {
			$.ajax({
				url : 'idDuplicateCheck',
				type : 'get',
				data : {
					id : $("#userid").val(),
				},
				dataType : "text",
				success : function(data, status, xhr) {
					$("#result").text(data);
				},
				error : function(xhr, status, error) {
				}
			});//end ajax
		});//end on

		$("#passwd2").on("keyup", function() { //비밀번호 일치여부 확인
			var pw2 = $(this).val();
			if (pw2 == $("#passwd").val()) {
				$("#result2").text("비밀번호 일치")
			} else {
				$("#result2").text("비밀번호 불일치")
			}
		}) //end passwd2

		/* 
		  submit 이벤트 발생시
		  1. 아이디 중복여부 체크 v
		  2. 아이디 입력여부 체크 v
		  3. 비밀번호 일치여부 체크v
		  4. 비밀번호 입력여부 체크v 
		  5. 전화번호 입력여부체크v
		  6. 전화번호 숫자인지 여부체크v
		  7. 이메일 입력여부 체크
		 */

		$("#form").on("submit", function() {

			//1. 아이디 중복여부 체크
			if ($("#result").text() == "아이디 사용불가능") {
				console.log("아이디 중복");
				alert("아이디가 중복되었습니다.");
				return false;
			}//if end

			//2.아이디 입력여부 체크
			if ($("#userid").val() == "") {
				console.log("userid 미입력");
				alert("아이디가 입력되지 않았습니다.")
				return false;
			}//if end

			//3. 비밀번호 일치여부 체크
			if ($("#result2").text() == "비밀번호 불일치") {
				console.log("비밀번호 불일치");
				alert("비밀번호가 불일치합니다.");
				return false;
			}//if end

			//4. 비밀번호 입력여부 체크
			if ($("#passwd").val() == "" || $("#passwd2").val() == "") {
				console.log("passwd 미입력");
				alert("비밀번호가 입력되지 않았습니다.")
				return false;
			}//if end

			//5. 전화번호  입력여부 체크
			if ($("#phone2").val() == "" || $("#phone3").val() == "") {
				console.log("phone 미입력");
				alert("핸드폰번호가 입력되지 않았습니다.");
				return false;
			}//if end

			//6. 전화번호 정수숫자인지 여부체크
			if ($("#phone2").val() % 1 != 0 || $("#phone3").val() % 1 != 0) {
				console.log("phone 숫자");
				alert("핸드폰번호는 정수숫자만 입력가능합니다.");
				return false;
			}//if end

			//7. 이메일 입력여부 체크
			if ($("#email1").val() == "" || $("#email2").val() == "") {
				console.log("email 미입력");
				alert("이메일이 입력되지 않았습니다.");
				return false;
			}//if end

		})//submit 이벤트 종료

	});//end ready
</script> 

<form id = "form" action="signUp" method="get">
*아이디:<input type="text" name="userid" id="userid">
<span id="result"></span>
<br> 
*비밀번호:<input type="text" name="passwd" id="passwd"><br> 
비빌번호확인:<input type="text" name="passwd2" id="passwd2">
<span id="result2"></span>
<br>
전화번호:<select id = "phone1" name="phone1">
  <option value="010">010</option>
  <option value="011">011</option>
</select>-
<input type="text" id = "phone2" name="phone2" >-<input type="text" id = "phone3" name="phone3" >
<br>
이메일:<input type="text" name="email1" id="email1">@
       <input type="text" name="email2" id="email2" placeholder="직접입력">
       <select  id="emailSelect">
        <option value="daum.net">daum.net</option>
        <option value="naver.com">naver.com</option>
       </select>
<br>
<button type="submit">회원가입</button>
<button type="reset">다시작성</button>
</form>


<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script> -->