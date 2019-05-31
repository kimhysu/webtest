<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
String id = request.getParameter("id");
String grade="";
grade = (String)session.getAttribute("grade");

if(id==null){
	id=(String)session.getAttribute("id");
}
MemberDTO dto = dao.read(id);

%>
<!DOCTYPE html> 
<html> 
<head>
  <title>회원정보</title>
  <meta charset="utf-8">

<script type="text/javascript"> 
function filedown(){
  var url = "<%=root%>/download";
  url += "?dir=/member/storage";
  url += "&filename=<%=dto.getFname()%>";
  location.href=url;
}
function del(){
  var url = "deleteForm.jsp";
  url +="?id=<%=id%>";
  url +="&oldfile=<%=dto.getFname()%>";
  location.href=url;
}
function update(){
  var url = "updateForm.jsp";
  url +="?id=<%=id%>";
  location.href=url;
}
function updateFile(){
  var url = "updateFileForm.jsp";
  url +="?id=<%=id%>";
  url +="&oldfile=<%=dto.getFname()%>";
  location.href=url;
}
function updatePw(){
  var url = "updatePwForm.jsp";
  url +="?id=<%=id%>";
  location.href=url;
}
function listM(){
  var url = "<%=root%>/admin/list.jsp";
  location.href=url;
}
</script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10"><%=dto.getMname() %>님의 회원정보</h1>
<table class="table table-bordered">
<tr>
<td colspan="2">
<img src="./storage/<%=dto.getFname() %>" class="img-rounded" height="200" width="200">   
</td>
</tr>
  <tr>
    <th>아이디</th>
    <td><%=dto.getId() %></td>
  </tr>
  <tr>
    <th>성명</th>
    <td><%=dto.getMname() %></td>
  </tr>
  <tr>
    <th>전화번호</th>
    <td><%=dto.getTel() %></td>
  </tr>
  <tr>
    <th>우편번호</th>
    <td><%=dto.getZipcode() %></td>
  </tr>
  <tr>
    <th>주소</th>
    <td><%=dto.getAddress1() %><%=dto.getAddress2() %></td>
  </tr>
  <tr>
    <th>직업</th>
    <td>직업 코드: <%=dto.getJob() %>(<%=Utility.getCodeValue(dto.getJob()) %>)</td>
  </tr>
  <tr>
    <th>날짜</th>
    <td><%=dto.getMdate() %></td>
  </tr>
</table>
<div style="text-align: center">
<button class="btn" onclick="update()">정보수정</button>
<button class="btn" onclick="del()">회원탈퇴</button>
<%if(id!=null && !grade.equals("A")){ %>
<button class="btn" onclick="updateFile()">사진수정</button>
<button class="btn" onclick="updatePw()">패스워드변경</button>
<button class="btn" onclick="filedown()">다운로드</button>
<%
}
if(id!=null && grade.equals("A")){
%>
<button class="btn" onclick="listM()">회원목록</button>
<%} %>
</div>
</div>
</body> 
</html> 