<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<form method="post" action="deleteProc.jsp">
		<div class="jumbotron">
		<input type="hidden" name="memono" value="<%=request.getParameter("memono")%>">
			<h3>삭제 확인</h3>
			<p>삭제를 하면 복구 될 수 없습니다.<br><br>
삭제하시려면 삭제버튼을 클릭하세요<br><br>
취소는 '목록'버튼을 누르세요</p>
		</div>
		<button class="btn">삭제</button> 
		<button type="button" class="btn" onclick="location.href='list.jsp'">목록</button>
		</form>
	</div>
	
	
</body>
</html>
