<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%

String upDir = "/test/storage";
String downDir = "/test/storage";

//파일 저장용 절대 경로 추출
upDir = application.getRealPath(upDir);
//파일 업로드시 임시 저장 폴더
String tempDir = application.getRealPath("/test/temp");
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
<style type="text/css">
*{
font-family: gulim;
font-size: 24px;
}
</style>
<link href='../css/style.css' rel='Stylesheet' type='text/css'>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">전송된 파일목록</h1>
<br><br>
<%
String title="";
FileItem fileItem = null;
String filename = "";
long filesize = 0;

UploadSave upload = new UploadSave(request, -1, -1, tempDir);
title = UploadSave.encode(upload.getParameter("title"));


out.println("제목: "+title+"<br><br>");

fileItem = upload.getFileItem("file1");
filesize = fileItem.getSize();//파일사이즈를 먼저 가지고오 오기 때문에 안가져와도 가능하며, 다 가져오지 않아도 실행가능

if(filesize>0){
	filename = UploadSave.saveFile(fileItem, upDir);
	out.println("전송된 파일명: "+filename+ "/전송된 파일사이즈: "+filesize+"<br>");
}

fileItem = upload.getFileItem("file2");
filesize = fileItem.getSize();

if(filesize>0){
  filename = UploadSave.saveFile(fileItem, upDir);
  out.println("전송된 파일명: "+filename+ "/전송된 파일사이즈: "+filesize+"<br>");
}
fileItem = upload.getFileItem("file3");
filesize = fileItem.getSize();

if(filesize>0){
  filename = UploadSave.saveFile(fileItem, upDir);
  out.println("전송된 파일명: "+filename+ "/전송된 파일사이즈: "+filesize+"<br>");
}

%>
</div>
</body> 
</html> 