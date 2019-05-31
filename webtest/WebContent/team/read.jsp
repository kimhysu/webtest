<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_team.jsp" %>
<jsp:useBean id="dao" class="team.TeamDAO"/>
<%
int teamno = Integer.parseInt(request.getParameter("teamno"));
TeamDTO dto = dao.read(teamno);
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
<script type="text/javascript">
function listTeam(){
  var url = "list.jsp";
  url +="?col=<%=request.getParameter("col")%>";
  url +="&word=<%=request.getParameter("word")%>";
  url +="&nowPage=<%=request.getParameter("nowPage")%>";
  location.href=url;
}
function updateTeam(){
  var url = "updateForm.jsp";
  url += "?teamno=<%=dto.getTeamno()%>";
  url +="&col=<%=request.getParameter("col")%>";
  url +="&word=<%=request.getParameter("word")%>";
  url +="&nowPage=<%=request.getParameter("nowPage")%>";
  location.href=url;
}
function deleteTeam(){
  var url = "deleteProc.jsp";
  url += "?teamno=<%=dto.getTeamno()%>";
  url +="&col=<%=request.getParameter("col")%>";
  url +="&word=<%=request.getParameter("word")%>";
  url +="&nowPage=<%=request.getParameter("nowPage")%>";
  location.href=url;
}
</script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h2>팀정보</h2>
<div class="panel panel-default">
<div class="panel-heading">이름</div>
<div class="panel-body"><%=dto.getName() %></div>
<div class="panel-heading">전화번호</div>
<div class="panel-body"><%=dto.getPhone() %></div>
<div class="panel-heading">성별</div>
<div class="panel-body"><%=dto.getGender() %></div>
<div class="panel-heading">보유기술</div>
<div class="panel-body"><%=dto.getSkillstr() %></div>
<div class="panel-heading">취미</div>
<div class="panel-body"><%=dto.getHobby() %></div>
<div class="panel-heading">주소</div>
<div class="panel-body">(<%=dto.getZipcode() %>)<%=dto.getAddress1()%></div>
<div class="panel-heading">상세주소</div>
<div class="panel-body"><%=dto.getAddress2() %></div>
</div>
<button class="btn" type="button" onclick="location.href='createForm.jsp'">등록</button>
<button class="btn" type="button" onclick="updateTeam()">수정</button>
<button class="btn" type="button" onclick="deleteTeam()">삭제</button>
<button class="btn" type="button" onclick="listTeam()">목록</button>
</div>
</body> 
</html> 