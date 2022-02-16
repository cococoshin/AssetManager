<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.BankDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    
<!-- 
추가해야 할 것 cart참고 ! 
3. 저장버튼 구현
4. db삭제 버튼 구현하기 
 -->    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
		newCell4.innerHTML = '<button class = "notDbDel" onclick = "notDbDel(this)" >삭제</button>'
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
	</tr>
	<tr>
		<td>신용카드</td>
		<td>현대</td>
		<td>일반지출</td>
		<td><button>삭제</button></td>
	</tr>
	<tr>
		<td>체크카드</td>
		<td>신한</td>
		<td>생활비지출</td>
		<td><button>삭제</button></td>
	</tr>
</table>
<!-- 예시테이블 end -->


<hr>



<button id = "addBtn" onclick="addRow()">계좌추가하기</button>
<form action="bankAdd">
<table id = "bankTable" border="1">
	<tr>
		<th>구분</th>
		<th>은행명</th>
		<th>내용</th>
	</tr>
	<%//반복문을 통해 저장된 데이터를 뿌려줌
		for(BankDTO dto : bkList){
	%>
	<tr>
		<input type="hidden" value="<%=dto.getNo()%>">
		<td><%=dto.getType() %></td>
		<td><%=dto.getBankname() %></td>
		<td><%=dto.getContents() %></td>
		<td>
			<button class="dbDel">삭제</button>
		</td>
	</tr>	
	<%
	}
	%><!-- end for -->

</table>
<button type="submit">저장</button>
</form>
</html>