<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<%
int memono = Integer.parseInt(request.getParameter("memono"));
MemoDTO dto = dao.readReply(memono);
 %>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">메모 답변</h1>
<form class="form-horizontal" 
      action="replyProc.jsp"
      method="post"
      >
<input type="hidden" name="memono" value="<%=dto.getMemono() %>">
<input type="hidden" name="memono" value="<%=dto.getGrpno() %>">
<input type="hidden" name="memono" value="<%=dto.getIndent() %>">
<input type="hidden" name="memono" value="<%=dto.getAnsnum() %>">

  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-6">
      <input type="text" name="title" id="title" class="form-control" value="<%=dto.getTitle() %>">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-6">
    <textarea rows="5" cols="5" id="content" name="content" class="form-control"></textarea>
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">등록</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 