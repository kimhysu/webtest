<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"></jsp:useBean>
<jsp:useBean id="dto" class="memo.MemoDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="*"/>
<% 
   boolean flag = dao.update(dto);
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
function listMemo(){
  var url ="list.jsp";
  url += "?col=<%=request.getParameter("col")%>";
  url += "&word=<%=request.getParameter("word")%>";
  url += "&nowPage=<%=request.getParameter("nowPage")%>";
  
  location.href=url;
}
</script>
</head>
<body> 
<div class="container">

<div class="well well-lg">
<%
   if(flag){
	   out.print("메모수정 성공입니다.");
   }else{
	   out.print("메모수정 실패입니다.");
   }

%>
</div>
<button class="btn" type="button" onclick="location.href='./createForm.jsp'">다시등록</button>
<button class="btn" type="button" onclick="listMemo()">목록</button>
</div>
</body> 
</html>


 