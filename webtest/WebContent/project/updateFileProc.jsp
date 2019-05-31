<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_project.jsp" %>
<jsp:useBean id="dao" class="project.ProjectDAO"></jsp:useBean>
<%


UploadSave upload = new UploadSave(request,-1,-1,tempDir);
int imgno = Integer.parseInt(upload.getParameter("imgno"));
String oldfile = UploadSave.encode(upload.getParameter("oldfile"));

FileItem fileItem = upload.getFileItem("fname");
if(oldfile!=null && !oldfile.equals("member.jpg")){
	  UploadSave.deleteFile(upDir, oldfile);
	}
	UploadSave.deleteFile(upDir, oldfile);//원본파일을 지운다
	String fname = UploadSave.saveFile(fileItem, upDir);
	
Map map = new HashMap();
map.put("fname", fname);
map.put("imgno",imgno);

boolean flag = dao.updateFile(map);
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
<h1 class="col-sm-offset-2 col-sm-10">사진수정확인</h1>
<div class="well well-lg">
<%
if(flag){
  out.print("사진 수정을 성공했습니다.");
}else{
  out.print("사진 수정을 실패했습니다..");
}

%>
</div>
<button class="btn" onclick="location.href='read.jsp?imgno=<%=imgno%>'">나의정보</button>
<button class="btn" onclick="history.back()">다시시도</button>
</div>
</body> 
</html> 