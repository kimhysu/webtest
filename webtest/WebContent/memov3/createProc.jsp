<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<jsp:useBean id="dto" class="memo.MemoDTO"/>
<jsp:setProperty name="dto" property="title"/>
<jsp:setProperty name="dto" property="content"/>
<% 
  
   boolean flag=dao.create(dto);

%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">

<div class="well well-lg">
<%
   if(flag){
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



 