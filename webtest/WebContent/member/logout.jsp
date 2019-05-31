<%@ page contentType="text/html; charset=UTF-8" %> 
<%
   session.invalidate(); //모든 세션변수 삭제
                         //request를 임의로 삭제할 수 없듯이, session도 임의로 삭제할 수 없다.
                         //requset는 응답되면 바로, session은 윈도우 창을 닫을 때나 혹은 시간이 지날때 
   response.sendRedirect("../index.jsp");
%>