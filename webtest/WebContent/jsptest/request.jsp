<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<DIV style='font-size: 28px'>
  1. <%=request.getRequestURL() %>
  2. <%=request.getRequestURI() %>
  3. 사용자로부터 입력을 받을 경우<br>
      급여: <%=request.getParameter("pay") %><br> 
  4. 사용자로부터 입력값이 여러개인 경우<br>
      급여: <%=request.getParameter("pay") %><br>
      성명: <%=request.getParameter("name") %><br>
  <%   
  int java = Integer.parseInt(request.getParameter("java"));
  int jsp = Integer.parseInt(request.getParameter("jsp"));
  int spring = Integer.parseInt(request.getParameter("spring"));
  int tot = java+jsp+spring;
  int avg = tot / 3;
  %>
      JAVA: <%=java %><br>
      JSP: <%=jsp %><br>
      Spring: <%=spring %><br>
      총점: <%=tot %><br>
      평균: <%=avg %><br>
</DIV>
</body>
</html>