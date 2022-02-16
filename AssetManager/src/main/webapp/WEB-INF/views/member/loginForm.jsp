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
<form action="login">
	<input type="text" name="userid" placeholder="아이디"><br> 
	<input type="text" name="passwd" placeholder="비밀번호"><br>
	<button type="submit">로그인</button>
</form>

<!-- 22/01/30 추후 구현 예정 기본기능 완료후 -->
<button type="button" onclick="location.href='idFind'">아이디 찾기</button>
<button type="button" onclick="location.href='pwFind'">비밀번호 찾기</button>
<button type="button" onclick="location.href='memberAdd'">회원가입하기</button>
</html>