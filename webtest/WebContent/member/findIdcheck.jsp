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

    if(id!=null){
      out.print("아이디는"+id+"입니다");
      }else{
        out.print("아이디가 없습니다.");
      }
    %>