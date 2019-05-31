<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
 String mname  = request.getParameter("mname");
 String email  = request.getParameter("email");
 
 
 Map map = new HashMap();
 map.put("mname", mname);
 map.put("email", email);
String id = dao.findId(map);


 
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
    <div class="well well-lg col-sm-10">
    입력 된 id: <%=id %><br><br>
    <%if(id!=null){
      out.print("아이디가 맞습니다.");
      }else{
        out.print("아이디가 없습니다.<br><br>");
      }
    %>
    </div>
    
    <div class="col-sm-offset-2 col-sm-5">
      <button class="btn" onclick="location.href='id_form.jsp'">다시시도</button>
      <button type="reset" class="btn" onclick="window.close()">닫기</button>
    </div>
  </div>
</body> 
</html> 