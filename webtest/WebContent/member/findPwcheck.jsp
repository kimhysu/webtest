<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
 String id  = request.getParameter("id");
 String email  = request.getParameter("email");
 
 
 Map map = new HashMap();
 map.put("id", id);
 map.put("email", email);
String passwd = dao.findPw(map);

    if(passwd!=null){
      out.print("패스워드는"+passwd+"입니다");
      }else{
        out.print("아이디가 없습니다.");
      }
    %>