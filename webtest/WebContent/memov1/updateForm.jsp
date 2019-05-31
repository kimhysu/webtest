<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding("utf-8"); 

  int memono = Integer.parseInt(request.getParameter("memono"));
  String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
  String user = "soldesk";
  String password = "1234";
  String driver = "oracle.jdbc.driver.OracleDriver";

  Class.forName(driver);

  Connection con = DriverManager.getConnection(url, user, password);

  StringBuffer sql = new StringBuffer();
  
  sql.append(" select memono, title, content ");
  sql.append(" from memo ");
  sql.append(" where memono= ? ");
  
  PreparedStatement pstmt = con.prepareStatement(sql.toString());
  pstmt.setInt(1, memono);
  
  ResultSet rs = pstmt.executeQuery();
  if(rs.next()){
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
<h1 class="col-sm-offset-2 col-sm-10">메모 수정</h1>
<form class="form-horizontal" 
      action="updateProc.jsp"
      method="post"
      >
      <input type="hidden" name="memono" value="<%=rs.getInt("memono")%>">

  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-6">
      <input type="text" name="title" id="title" class="form-control" value="<%=rs.getString("title")%>">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-6">
    <textarea rows="5" cols="5" id="content" name="content" class="form-control"><%=rs.getString("content")%></textarea>
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">수정</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 
<% }
if(rs!=null) rs.close();
if(pstmt !=null) pstmt.close();
if(con != null) con.close();

 %>
