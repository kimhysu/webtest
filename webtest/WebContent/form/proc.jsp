<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
  *{ 
    font-family: 돋움체; 
    font-size: 24px; 
  } 
</style> 
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %> 

제목: <%=request.getParameter("title") %><br><br> 
내용: <%=request.getParameter("content") %><br><br> 
패스워드: <%=request.getParameter("passwd") %> 
</body> 
</html> 
