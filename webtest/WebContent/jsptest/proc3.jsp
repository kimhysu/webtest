<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
  *{ 
    font-family: 굴림체; 
    font-size: 24px; 
  } 
</style>
</head>
<body>
<DIV style='font-size: 24px;'>
  <%
  String area = request.getParameter("area");
  
  out.println("지역 선택 1: " + area + "<BR>");
  
  String hobby1 = request.getParameter("hobby1");
  String hobby2 = request.getParameter("hobby2");
  String hobby3 = request.getParameter("hobby3");
  
  if (hobby1 != null){
    out.println("hobby1: " + hobby1 + "<br>");
  }
  
  if (hobby2 != null){
    out.println("hobby2: " + hobby2 + "<br>");
  }
 
  if (hobby3 != null){
    out.println("hobby3: " + hobby3 + "<br>");
  }
 
  
  String[] hobby = request.getParameterValues("hobby"); 
  
  if (hobby != null){ // 선택한 Checkbox가 있는 경우
 
    for(int i=0; i<hobby.length; i++){
      out.println(hobby[i] + " ");
    }
    
  }
  %>
</DIV>
</body>
</html>