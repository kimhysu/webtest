<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<% 
    request.setCharacterEncoding("utf-8"); 
    String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
    String user = "soldesk";
    String password = "1234";
    String driver = "oracle.jdbc.driver.OracleDriver";
   
    Class.forName(driver);
   
    Connection con = DriverManager.getConnection(url,user,password);
   
    StringBuffer sql = new StringBuffer();
    sql.append(" select memono,  to_char(wdate,'yyyy-mm-dd') wdate, ");
    sql.append(" viewcnt, title ");
    sql.append(" from memo ");
    sql.append(" order by memono desc ");
    
    PreparedStatement pstmt = con.prepareStatement(sql.toString());
    
    ResultSet rs = pstmt.executeQuery();
    
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
  <script type="text/javascript">
    function read(memono){
    var url = "read.jsp";
    url+="?memono="+memono;
    
    location.href=url;
    }
  </script>
</head>
<body> 
<div class="container">

  <h2>메모 목록</h2>
  <table class="table table-striped">
   <thead>
    <tr>
    <th>번호</th>
    <th>제목</th>
    <th>날짜</th>
    <th>조회수</th>
    </tr>
   </thead>
   <tbody>
<% if(rs.next()==false){ %> 
   <tr><td colspan="4">등록된 메모가 없습니다.</td>

<% }else{
  
   do{   
%> 
   <tr>
    <td><%=rs.getInt("memono") %></td>
    <td><a href="javascript:read('<%=rs.getInt("memono")%>')"><%=rs.getString("title") %></td>
    <td><%=rs.getString("wdate") %></td>
    <td><%=rs.getInt("viewcnt") %></td>
    </tr>
<%  
    }while(rs.next());
   }
%>  
   </tbody>
  
  </table>
  <div>
   <button type="button" onclick="location.href='./createForm.jsp'">등록</button>
  </div>
</div>
</body> 
</html> 
<%
if(rs!=null) rs.close();
if(pstmt !=null) pstmt.close();
if(con != null) con.close();

 %>




