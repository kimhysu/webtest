<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_guestbook.jsp"%>
<jsp:useBean id="dao" class="guestbook.GuestBookDAO"></jsp:useBean>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	GuestBookDTO dto = dao.read(no);
%>

<!DOCTYPE html>
<html>
<head>
<title>방명록 확인</title>
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
		<h2>방명록 정보</h2>
		<div class="panel panel-default">
			<div class="panel-heading">이름</div>
			<div class="panel-body"><%=dto.getName()%></div>
			<div class="panel-heading">성별</div>
			<div class="panel-body"><%=dto.getGender()%></div>
			<div class="panel-heading">관계</div>
			<div class="panel-body"><%=dto.getPartstr()%></div>
			<div class="panel-heading">제목</div>
			<div class="panel-body"><%=dto.getTitle()%></div>
			<div class="panel-heading">내용</div>
			<div class="panel-body"><%=dto.getContent()%></div>
			<div class="panel-heading">날짜</div>
			<div class="panel-body"><%=dto.getRegdate()%></div>




		</div>
		<button class="btn" type="button"
			onclick="location.href='createForm.jsp'">등록</button>

		<button class="btn" type="button" onclick="location.href='list.jsp'">목록</button>
	</div>

</body>
</html>