<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_project.jsp" %>
<%
int imgno = Integer.parseInt(request.getParameter("imgno"));
String oldfile = request.getParameter("oldfile");
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>이미지 삭제</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">이미지삭제</h1>
<form class="form-horizontal" 
      action="deleteProc.jsp"
      method="post"
      >
      <input type="hidden" name="imgno" value="<%=imgno%>">
      <input type="hidden" name="oldfile" value="<%=oldfile%>">
      <input type="hidden" name="col" value="<%=request.getParameter("col")%>">
      <input type="hidden" name="word" value="<%=request.getParameter("word")%>">
      <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
      <div class="form-group">
    <label class="col-sm-offset-2 col-sm-6" >
    정말 삭제하시겠습니까?
    </label>
    </div>
  
   <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">이미지삭제</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 