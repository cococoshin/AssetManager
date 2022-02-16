<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
<!DOCTYPE html>
<html>
<%
	String mesg = (String) request.getAttribute("mesg");
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	<%if(mesg != null){%>
	alert("<%=mesg%>")
	<%}%>
</script>
<meta charset="UTF-8">

<table border="1">
	<tr>
	<th colspan="6">예시</th>
	</tr>
	<tr>
		<th>날짜</th>
		<th>계좌</th>
		<th>수입구분</th>
		<th>내용</th>
		<th>금액</th>
		<th></th><!-- 추가 or 삭제를 만들 버튼 추가 생성 -->
	</tr>
	<tr>
		<td>21/11/01</td>
		<td>급여계좌</td>
		<td>월급</td>
		<td>11월월급</td>
		<td>2000000</td>
		<td>
			<button>추가</button>
			<button>삭제</button>
		</td>
	</tr>
	<tr>
		<td>21/11/17</td>
		<td>체크카드</td>
		<td>상여금</td>
		<td>3분기상여금</td>
		<td>500000</td>
		<td>
			<button>추가</button>
			<button>삭제</button>
		</td>
	</tr>
</table>

<hr>

<table border="1">
	
	
	<tr>
		<th>날짜</th>
		<th>계좌</th>
		<th>수입구분</th>
		<th>내용</th>
		<th>금액</th>
		<th></th><!-- 추가 or 삭제를 만들 버튼 추가 생성 -->
	</tr>
	

</table>
</html>