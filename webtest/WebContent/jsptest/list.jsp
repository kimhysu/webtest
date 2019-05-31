<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/ssi/ssi_guestbook.jsp"%>
<jsp:useBean id="dao" class="guestbook.GuestBookDAO"></jsp:useBean>
<%
	List<GuestBookDTO> list = dao.list();
%>
<!DOCTYPE html>
<html>
<head>
<title>방명록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
function read(no){
	var url = "read.jsp";
	url +="?no="+no;
	location.href=url;
}
function update(no){
	var url ="updateForm.jsp";
	url +="?no="+no;
	location.href=url;
}
function del(no){
	if(confirm("정말 삭제 하시겠습니까?")){
		var url ="deleteProc.jsp";
		url +="?no="+no;
		location.href = url;
	}
}
</script>
<style type="text/css">


</style>
</head>
<body>

	<div class="container">
		<h2>방명록</h2>
		<table class="table table-striped">
			<thead align="center">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>관계</th>
					<th>날짜</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
					if (list.size() == 0) {
				%>
				<tr>
					<td colspan="5">등록된 방명록이 없습니다.</td>
				</tr>
				<%
					} else {
						for (int i = 0; i < list.size(); i++) {
							GuestBookDTO dto = list.get(i);
				%>
				<tr>
					<td><%=dto.getNo()%></td>
					<!-- 이름은 누르면 read로 이동하여 이름에 해당하는 내용이 보여지도록 -->
					<td><a href="javascript:read('<%=dto.getNo()%>')"><%=dto.getTitle()%></a></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getPartstr()%></td>					
					<td><%=dto.getRegdate() %></td>
					<td><a href="javascript:update('<%=dto.getNo() %>')">수정/</a>
						<a href="javascript:del('<%=dto.getNo() %>')">삭제</a>
					</td>
				</tr>
				<%
				}
			}
			%>
			</tbody>
		</table>
		<button class="btn" type="button"
			onclick="location.href='./createForm.jsp'">등록</button>
	</div>

</body>
</html>