<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_member.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
String email = request.getParameter("email");

boolean flag = dao.duplicateEmail(email);
if(flag){
			out.print("중복되어 사용 할 수 없습니다.");
			}else{
				out.print("중복아님, 사용 가능합니다.");
			}
		%>