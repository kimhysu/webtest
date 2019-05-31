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
<H1>뉴스 등록</H1> 

<DIV> 

<FORM name='frm' method='GET' action='./proc.jsp'>  
  제목: <input type='text' name='title' value='' size='30'><br> 
  내용: <textarea name='content' rows='10' cols='30'></textarea><br> 
  패스: <input type='password' name='passwd' size='30'><br> 
  <input type='submit' value='등록'> 
</FORM> 
</DIV>
</body>
</html>