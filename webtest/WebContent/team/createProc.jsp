<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_team.jsp"%> 
<jsp:setProperty name="dto" property="*" />

<%
  boolean flag = dao.create(dto);
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

<% 
   // form의  submit을 통해서('등록'버튼을 눌러서),
   // action값이 있는 것은 받아서 와야 한다.
   // ** form의 input태그에서 작성된 value값을 action을 통해서 받아오는 것이다.
   // ** 즉, request.getParameter("");는 를 통해서 (1개만)받아온 것이다.
   // request.getParameterValues("");는 (여러개를)받아올 수 있다. <- 여러개니까 배열을 통해서 for문을 돌려서 가져오도록 하자.
%>

<div class="container">
<fieldset>
<legend>팀 정보 확인</legend>
  <%
      if(flag){
        out.print("팀 정보 생성에 성공했습니다.");
      }else{
        out.print("팀 정보 생성에 실패했습니다.");
      }
    %>
</fieldset>
</div>

</body> 
</html> 