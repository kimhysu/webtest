<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_open.jsp" %>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	/*조회수증가*/
	sql.append(" update memo ");
	sql.append(" set viewcnt = viewcnt+1 ");
	sql.append(" where memono= ? ");

	pstmt = con.prepareStatement(sql.toString());
	pstmt.setInt(1, memono);

	pstmt.executeUpdate();

	/*조회*/
	sql.delete(0, sql.length());
	sql.append(" select memono, title, viewcnt, content, ");
	sql.append(" to_char(wdate,'yyyy-mm-dd') wdate ");
	sql.append(" from memo ");
	sql.append(" where memono =? ");

	pstmt = con.prepareStatement(sql.toString());
	pstmt.setInt(1, memono);

	rs = pstmt.executeQuery();
	String content = "";
	if (rs.next()) {

		content = rs.getString("content");
		content = content.replaceAll("\r\n", "<br>");
	}
%>

<!DOCTYPE html>
<html>
<script type="text/javascript">
function updateMemo(){
  var url = "updateForm.jsp";
  url += "?memono=<%=rs.getInt("memono")%>";
  location.href=url;
}
function deleteMemo(){
  var url = "deleteForm.jsp";
  url += "?memono=<%=rs.getInt("memono")%>";
  location.href=url;
}
</script>

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

		<h2>조회</h2>
		<div class="panel panel-default">
		<div class="panel-heading">제목</div>
		<div class="panel-body"><%=rs.getString("title")%></div>

		<div class="panel-heading">내용</div>
		<div class="panel-body"><%=content%></div>

		<div class="panel-heading">조회수</div>
		<div class="panel-body"><%=rs.getInt("viewcnt")%></div>

		<div class="panel-heading">등록일</div>
		<div class="panel-body"><%=rs.getString("wdate")%></div>
	</div>

	<div>
		<button type="button" class="btn"
			onclick="location.href='./createForm.jsp'">등록</button>
		<button type="button" class="btn" onclick="updateMemo()">수정</button>
		<button type="button" class="btn" onclick="deleteMemo()">삭제</button>
		<button type="button" class="btn"
			onclick="location.href='./list.jsp'">목록</button>
	</div>
	</div>
</body>
</html>
<%@ include file="/ssi/ssi_close.jsp" %>
