<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
String id = request.getParameter("id");
String pw = request.getParameter("passwd");

Map map = new HashMap();
map.put("id", id);
map.put("pw", pw);

boolean flag = dao.updatePw(map);
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>비밀번호변경 확인</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">비밀번호변경 확인</h1>
<div class="well well-lg">
<%
if(flag)
	out.print("비밀번호 번경을 성공하였습니다.");
else
	out.print("비밀번호 번경을 실패하였습니다.");
%>
</div>
<button class="btn" onclick="location.href='read.jsp?id=<%=id%>'">나의정보</button>
<button class="btn">다시시도</button>
</div>

</body> 
</html> 