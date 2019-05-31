<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
public int tot(int kuk, int eng, int mat){
  return kuk+eng+mat;
}
 
public int avg(int tot){
  return tot/3;
}
%>
 
<%
String name = "아로미";
int kuk = 90;
int eng = 85;
int mat = 100;
int tot = tot(kuk, eng, mat);
int avg = avg(tot);
%>
<H1>성적표</H1>
<UL style='font-size: 24px;'>
  <LI> 성명: <% out.print(name); %>
  <LI> 국어: <%=kuk %>
  <LI> 영어: <%=eng %>
  <LI> 수학: <%=mat %>
  <LI> 총점: <%=tot %>
  <LI> 평균: <%=avg %>
</UL>
</body>
</html>