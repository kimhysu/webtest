<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_project.jsp" %>
<%
int imgno = Integer.parseInt(request.getParameter("imgno"));
String oldfile = request.getParameter("oldfile");
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>사진 수정</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">사진 수정</h1>
<form class="form-horizontal" 
      action="updateFileProc.do"
      method="post"
      enctype="multipart/form-data"
      >
<input type="hidden" name="oldfile" value="<%=oldfile %>">
<input type="hidden" name="imgno" value="<%=imgno %>">
      
  <div class="form-group">
    <label class="control-label col-sm-2" for="oldfile">원본파일</label>
    <div class="col-sm-6">
      <img src="./storage/<%=oldfile%>" class="img-rounded" width="200" height="200">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="oldfile">변경파일</label>
    <div class="col-sm-6">
    <input type="file" class="form-control" name="fname" accept=".png, .gif, .jpg" required="required">
    </div>
  </div>
  
 
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">수정</button>
    <button type="reset" class="btn" onclick="history.back()">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 