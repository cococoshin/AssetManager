<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.BankDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
    
<!DOCTYPE html>
<html>
<%
	String mesg = (String) request.getAttribute("mesg");
	List<BankDTO> bkList = (List<BankDTO>) session.getAttribute("bankList");
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	<%if(mesg != null){%>
	alert("<%=mesg%>")
	<%}%>
	
	/* 
	저장전 동작기능
	: 계좌추가하기 버튼 클릭시 행추가
	: 삭제 버튼 클릭시 행삭제
	*/
	function addRow() { //행추가하기 버튼 클릭시 행추가
		const table = document.getElementById('bankTable');
		const newRow = table.insertRow();
		const newCell1 = newRow.insertCell(0);
		const newCell2 = newRow.insertCell(1);
		const newCell3 = newRow.insertCell(2);
		const newCell4 = newRow.insertCell(3);
		const newCell5 = newRow.insertCell(4);
		newCell1.innerHTML = 
			'<select  id="type" name="type">'
	        +'<option value="체크카드">체크카드</option>'
	        +'<option value="신용카드">신용카드</option>'
	        +'<option value="입출금통장">입출금 통장</option>'
	        +'<option value="적금통장">적금 통장</option>'
	        +'<option value="청약통장">청약 통장</option>'
	        +'<option value="투자용통장">투자용 통장</option>'
	        +'<option value="현금">현금</option>'
	        +'</select>'
		newCell2.innerHTML = '<input type = "text" name = "bankname" >'
		newCell3.innerHTML = '<input type = "text" name = "contents" >'
		newCell4.innerHTML = '<input type = "text" name = "deposit" >'
		newCell5.innerHTML = '<button class = "notDbDel" onclick = "notDbDel(this)" >삭제</button>' //db에 저장되기전 삭제버튼을 다르게 구성
	}//addRow end
	
	function notDbDel(obj) { //DB에서 뿌려지지 않고 사용자가 직접 추가한 행 "저장전" 삭제하기
		var tr = obj.parentNode.parentNode;
		tr.parentNode.removeChild(tr);
	} //function end
	
	/* 
	저장버튼 클릭시 -> 새로 입력한 내용만 저장
	DB에서 뿌려진 데이터 삭제버튼 클릭시 -> DB에서 삭제
	값 미입력시 form이벤트 정지기능 구현
	*/
	$(function() {
		//저장버튼 클릭시 저장 02/20완료
		$("#bankAddBtn").on("click", function() {
			$("#addForm").attr("action", "bankAdd");
			return true;
		})//end bankAddBtn click event

		//삭제버튼 클릭시 삭제구현 02/20완료
		$(".dbDel").on("click", function() {
			event.preventDefault(); //form의 action실행 방지
			var no = $(this).val(); // no가져오기
			var noTr = $(this); 

			$.ajax({
				url : "bankDel",
				type : "get",
				dataType : "Text",
				data :{
					no : no
				},
				success: function(data, status, xhr) {
					console.log("ajax success")
					noTr.parents().filter("tr").remove();
				},
				error : function(xhr, status, error) {
					console.log("ajax fail")
				}
			}) //ajax end
		})//dbDel click enend
	
		//수정버튼 클릭시 삭제구현 02/20완료
		$(".dbUpd").on("click", function() {
			event.preventDefault(); //form의 action실행 방지
			var no = $(this).val(); // no가져오기
			var type = $("#type"+no).val(); 
			var bankname = $("#bankname"+no).val(); 
			var contents = $("#contents"+no).val(); 
			var deposit = $("#deposit"+no).val();
			
			console.log(no, type, bankname, contents, deposit);
			
		$.ajax({
				url : "bankUpd",
				type : "get",
				dataType : "Text",
				data :{
					no : no,
					type : type,
					bankname : bankname,
					contents : contents,
					deposit : deposit
				},
				success: function(data, status, xhr) {
					console.log("ajax success")
				},
				error : function(xhr, status, error) {
					console.log("ajax fail")
				}
			}) //ajax end
		})//dbUpd click enend 

	
	
	})//end ready	
</script>

<meta charset="UTF-8">

<!-- 예시테이블 -->
<table border="1">
	<tr>
	<th colspan="6">예시</th>
	</tr>
	<tr>
		<th>구분</th>
		<th>은행명</th>
		<th>내용</th>
		<th>금액</th>
	</tr>
	<tr>
		<td>신용카드</td>
		<td>현대</td>
		<td>일반지출</td>
		<td>0</td>
		<td><button>삭제</button></td>
	</tr>
	<tr>
		<td>체크카드</td>
		<td>신한</td>
		<td>생활비지출</td>
		<td>423000</td>
		<td><button>삭제</button></td>
	</tr>
</table>

<br>
<!-- 예시테이블 end -->


<hr><br>
<b>입력금액이 없다면 공란이 아닌 0입력</b><br>

<button id = "addBtn" onclick="addRow()">계좌추가하기</button>
<form id = "addForm" >


	<table id="bankTable" border="1">
		<tr>
			<th>구분</th>
			<th>은행명</th>
			<th>내용</th>
			<th>금액</th>
		</tr>
		<%//반복문을 통해 저장된 데이터를 뿌려줌
		for(BankDTO dto : bkList){
			int no = dto.getNo();
			String type = dto.getType();
			String Bankname = dto.getBankname();
			String Contents = dto.getContents();
			int Deposit = dto.getDeposit();
			String Userid = dto.getUserid();
	%>
			<input type="hidden" value="<%=no%>" id="<%=no%>">
			<input type="hidden" value="<%=Userid%>" id="<%=Userid%><%=no%>">
		<tr>
			<td><select id="type<%=no%>" name="type">
					<option value="체크카드" <%if (type.equals("체크카드")) {%>
						selected="selected" <%}%>>체크카드</option>
					<option value="신용카드" <%if (type.equals("신용카드")) {%>
						selected="selected" <%}%>>신용카드</option>
					<option value="입출금통장" <%if (type.equals("입출금통장")) {%>
						selected="selected" <%}%>>입출금 통장</option>
					<option value="적금통장" <%if (type.equals("적금통장")) {%>
						selected="selected" <%}%>>적금 통장</option>
					<option value="청약통장" <%if (type.equals("청약통장")) {%>
						selected="selected" <%}%>>청약 통장</option>
					<option value="투자용통장" <%if (type.equals("투자용통장")) {%>
						selected="selected" <%}%>>투자용 통장</option>
					<option value="현금" <%if (type.equals("현금")) {%> selected="selected"
						<%} %>>현금</option>
			</select></td>



			<td><input type = "text" id="bankname<%=no%>" value = <%=Bankname %>></td>
			<td><input type = "text" id="contents<%=no %>" value = <%=Contents %>></td>
			<td><input type = "text" id="deposit<%=no %>" value = <%=Deposit %>></td>
			<td>
				<button class="dbDel" value="<%=no%>">삭제</button>
			</td>
			<td>
				<button class="dbUpd" value="<%=no%>">수정</button>
			</td>
		</tr>
		<%
	}
	%><!-- end for -->

	</table>
	<button type="submit" id = "bankAddBtn">저장</button>
</form>
</html>