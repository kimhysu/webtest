<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_team.jsp"%>
<jsp:useBean id="dao" class="team.TeamDAO" />
<jsp:useBean id="dto" class="team.TeamDTO" />
<jsp:setProperty name="dto" property="*" />
<% 
boolean flag = dao.update(dto);

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
<script type="text/javascript">
function listTeam(){
  var url = "list.jsp";
  url +="?col=<%=request.getParameter("col")%>";
  url +="&word=<%=request.getParameter("word")%>";
  url +="&nowPage=<%=request.getParameter("nowPage")%>";
  location.href=url;
}
</script>
</head>
<body>
	<div class="container">
		<fieldset>
			<legend>팀정보 수정 확인</legend>
			<%if(flag)
	out.print("팀정보를 생성했습니다. ");
else
	out.print("팀정보 생성을 실패했습니다. ");


%>
</fieldset>
<button type="button" onclick="listTeam()">목록</button>
<button type="button" onclick="location.href='createForm.jsp'">다시등록</button>
</div>
</body> 
</html> 