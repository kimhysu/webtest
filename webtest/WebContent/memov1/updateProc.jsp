<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<% request.setCharacterEncoding("utf-8"); 
   
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   int memono = Integer.parseInt(request.getParameter("memono"));
   
   String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
   String user = "soldesk";
   String password = "1234";
   String driver = "oracle.jdbc.driver.OracleDriver";
   
   Class.forName(driver);
   
   Connection con = DriverManager.getConnection(url,user,password);
   
   StringBuffer sql = new StringBuffer();
   sql.append(" update memo ");
   sql.append(" set title= ?, ");
   sql.append(" content = ? ");
   sql.append(" where memono = ? ");
   PreparedStatement pstmt = con.prepareStatement(sql.toString());
   
   pstmt.setString(1, title);
   pstmt.setString(2, content);
   pstmt.setInt(3, memono);
   
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
	   out.print("메모수정 성공입니다.");
   }else{
	   out.print("메모수정 실패입니다.");
   }

%>
</div>
<button class="btn" type="button" onclick="location.href='./createForm.jsp'">다시등록</button>
<button class="btn" type="button" onclick="location.href='./list.jsp'">목록</button>
</div>
</body> 
</html>
<%
  if(pstmt !=null) pstmt.close();
  if(con != null) con.close();
%>



 