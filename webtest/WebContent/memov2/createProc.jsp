<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_open.jsp" %>
<% 
   
   String title = request.getParameter("title");
   String content = request.getParameter("content");
  
   sql.append(" insert into memo(memono, title, content, wdate) ");
   sql.append(" values(memo_seq.nextval,?,?,sysdate) ");
		   
   pstmt = con.prepareStatement(sql.toString());
   
   pstmt.setString(1, title);
   pstmt.setString(2, content);
   
   int cnt = pstmt.executeUpdate();
%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body> 
<div class="container">

<div class="well well-lg">
<%
   if(cnt>0){
	   out.print("메모등록 성공입니다.");
   }else{
	   out.print("메모등록 실패입니다.");
   }

%>
</div>
<button class="btn" type="button" onclick="location.href='./createForm.jsp'">다시등록</button>
<button class="btn" type="button" onclick="location.href='./list.jsp'">목록</button>
</div>
</body> 
</html>
<%@ include file="/ssi/ssi_close.jsp" %>



 