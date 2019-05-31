<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	dao.upViewcnt(memono);
	MemoDTO dto = dao.read(memono);
	
  String content = dto.getContent().replaceAll("\r\n", "<br>");
%>

<!DOCTYPE html>
<html>
<script type="text/javascript">
function listMemo(){
  var url = "list.jsp";
  url +="?col=<%=request.getParameter("col")%>";
  url +="&word=<%=request.getParameter("word")%>";
  url +="&nowPage=<%=request.getParameter("nowPage")%>";
  location.href=url;
}
function replyMemo(){
  var url = "replyForm.jsp";
  url += "?memono=<%=dto.getMemono()%>";
 
  location.href=url;
}
function updateMemo(){
  var url = "updateForm.jsp";
  url += "?memono=<%=dto.getMemono()%>";
  url +="&col=<%=request.getParameter("col")%>";
  url +="&word=<%=request.getParameter("word")%>";
  url +="&nowPage=<%=request.getParameter("nowPage")%>";
  location.href=url;
}
function deleteMemo(){
  var url = "deleteForm.jsp";
  url += "?memono=<%=dto.getMemono()%>";
  url +="&col=<%=request.getParameter("col")%>";
  url +="&word=<%=request.getParameter("word")%>";
  url +="&nowPage=<%=request.getParameter("nowPage")%>";
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
<jsp:include page="/menu/top.jsp"/> 
	<div class="container">

		<h2>조회</h2>
		<div class="panel panel-default">
		<div class="panel-heading">제목</div>
		<div class="panel-body"><%=dto.getTitle()%></div>

		<div class="panel-heading">내용</div>
		<div class="panel-body"><%=content%></div>

		<div class="panel-heading">조회수</div>
		<div class="panel-body"><%=dto.getViewcnt()%></div>

		<div class="panel-heading">등록일</div>
		<div class="panel-body"><%=dto.getWdate()%></div>
	</div>

	<div>
		<button type="button" class="btn"
			onclick="location.href='./createForm.jsp'">등록</button>

		<button type="button" class="btn" onclick="updateMemo()">수정</button>
		<button type="button" class="btn" onclick="deleteMemo()">삭제</button>
		<button type="button" class="btn"
			onclick="listMemo()">목록</button>
			 <button type="button" class="btn" onclick="replyMemo()">답변</button>
	</div>
	</div>
</body>
</html>