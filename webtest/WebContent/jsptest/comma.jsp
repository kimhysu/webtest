<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
public String comma(long val){
  DecimalFormat df = new DecimalFormat("￦ ###,###,### 원");
  String str = df.format(val);
  
  return str;
}
%>  
 
<H1>6월 급여 명세서</H1>
<DIV style='font-size: 24px; color: #FFFFFF; background-color: #000055'>
  본봉: <%=comma(1800000) %><br>
  수당: <%=comma(200000) %><br>
  세금: <SPAN style='color: #FF0000'><%=comma(100000) %></SPAN><br>
  실수령액: <%=comma(1900000) %><br><br>
  <SPAN style='color: #00FF00'>수고하셨습니다.</SPAN>
 
</DIV>
</body>
</html>