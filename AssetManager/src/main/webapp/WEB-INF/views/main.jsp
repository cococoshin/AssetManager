<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/mainStyle.css">

<div class="topSidebar">
	<jsp:include page="menu/topMenu.jsp"></jsp:include>
</div>
<div class="leftSidebar">
</div>
<div class = "contents">
		<jsp:include page="summary/summary.jsp"></jsp:include> <!-- 내용이 들어가는 부분 -->
</div>
</html>