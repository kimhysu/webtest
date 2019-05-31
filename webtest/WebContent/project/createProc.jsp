<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_project.jsp" %>
<jsp:useBean id="dao" class="project.ProjectDAO"/>
<jsp:useBean id="dto" class="project.ProjectDTO"/>
<%
UploadSave upload = new UploadSave(request,-1,-1,tempDir);
dto.setTitle(UploadSave.encode(upload.getParameter("title")));
dto.setContent(UploadSave.encode(upload.getParameter("content")));
dto.setMname(UploadSave.encode(upload.getParameter("mname")));
dto.setPasswd(upload.getParameter("passwd"));
FileItem fileItem = upload.getFileItem("fname");
int size = (int)fileItem.getSize();

String fname = UploadSave.saveFile(fileItem, upDir);


if(size>0){
  dto.setFname(fname);
}else{
  dto.setFname("member.jpg");
}

boolean flag = dao.create(dto);
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
<div class="well well-lg">
<%
if(flag){
  out.print("회원가입을 했습니다.");
}else{
  out.print("회원가입을 실패했습니다.");
}
%>
</div>
<button class="btn" onclick="location.href='list.jsp'">목록</button>
<button class="btn" onclick="history.back()">다시시도</button>
</div>
</body> 
</html> 