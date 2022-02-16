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
<!--location.href='aaa' 이 주수로 가게됨  -->
<button type="button" onclick="location.href='bank'">계좌관리</button> <!-- 금융상품 수입원 외 모든 수입 -->
<button type="button" onclick="location.href='income'">소득</button> <!-- 금융상품 수입원 외 모든 수입 -->
<button type="button" onclick="location.href='income'">소득</button> <!-- 금융상품 수입원 외 모든 수입 -->
<button type="button" onclick="location.href='expend'">지출</button> <!-- 금융상품을 포함한 모든 지출 -->
<button type="button" onclick="location.href='saving'">저금</button> <!-- 적금 및 비상금을 포함한 모든 저금 -->
<button type="button" onclick="location.href='asset'">자산</button> <!-- 금융상품 수입원 외 모든 수입 -->
<button type="button" onclick="location.href='invest'">투자</button> <!-- 부동산, 주식과 같은 risk를 수반하는 모든 금융활동 -->
<button type="button" onclick="location.href='invest'">대출</button> <!-- 12개월 이상 상환해야 하는 모든 금융활동-->
<button type="button" onclick="location.href='main'">요약</button> <!-- 12개월 이상 상환해야 하는 모든 금융활동-->

</html>