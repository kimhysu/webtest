<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
   String root = request.getContextPath();
   String id = (String)session.getAttribute("id");
   String grade = (String)session.getAttribute("grade");
   String str = "기본페이지입니다.";
   if(id!=null && !grade.equals("A")){
	   str= "안녕하세요" +id  + "님";
   }else if(id!=null && grade.equals("A")){
	   str = "관리자페이지입니다.";
   }
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style type="text/css">
    #grade{
      color: fuchsia;
    }
  </style>
  
</head>
<body>

<div class="container">
  <div class="page-header row">
   <div class="col-sm-4">
    <img src="<%=root %>/images/img_chania.jpg" class="img-responsive img-thumbnail" alt="Cinque Terre" >
   </div>
   
   <div class="col-sm-8"><h1>로그인 페이지이이이</h1>
    <p>안녕안녕안녕</p>
    <p>안녕안녕안녕</p>
    <h2 id="grade"><%=str %></h2>
   </div>
  
  </div>
  <ul class="nav nav-tabs">
    <li class="active"><a href="<%=root%>/index.jsp">Home</a></li>
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판 <span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="<%=root%>/bbs/createform.jsp">생성</a></li>
        <li><a href="<%=root%>/bbs/list.jsp">목록</a></li>
        <li><a href="#">Submenu 1-3</a></li>                        
      </ul>
    </li>
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">메모<span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="<%=root%>/memov3/createform.jsp">생성</a></li>
        <li><a href="<%=root%>/memov3/list.jsp">목록</a></li>                  
      </ul>
    </li>
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">팀<span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="<%=root%>/team/createform.jsp">생성</a></li>
        <li><a href="<%=root%>/team/list.jsp">목록</a></li>                        
      </ul>
    </li>
    <%if(id==null) {%>
    <li><a href="<%=root%>/member/agreement.jsp">회원가입</a></li>
    <li><a href="<%=root%>/member/loginForm.jsp">로그인</a></li>
    <%}else{ %>
    <li><a href="<%=root%>/member/read.jsp">나의정보</a></li>
    <li><a href="<%=root%>/member/updateForm.jsp">회원수정</a></li>
    <li><a href="<%=root%>/member/logout.jsp">로그아웃</a></li>
    <%
    }
    if(id!=null && grade.equals("A")){
    %>
    <li><a href="<%=root%>/admin/list.jsp">회원목록</a></li>
    <%} %>
  </ul>
</div>

</body> 
</html> 