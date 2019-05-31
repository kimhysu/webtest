<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<DIV style='font-size: 36px; color: #FFFFFF; background-color: #FF3399;'> 
<% 
Date date = new Date(); // Date cannot be resolved to a type 
out.println(date.toLocaleString()); 
%> 
</DIV> 
</body>
</html>