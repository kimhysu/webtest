<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %> 

<DIV style='font-size: 24px'> 
<% 
String area = request.getParameter("area"); 
String area2 = request.getParameter("area2"); 

out.println("지역 선택 1: " + area + "<BR>"); 
out.println("지역 선택 2: " + area2); 
%> 
</DIV> 
</body>
</html>