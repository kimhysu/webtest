<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%
String upDir="/test/storage";
String tempDir="/test/temp";

upDir = application.getRealPath(upDir);
tempDir = application.getRealPath(tempDir);

//-1은 크키지정 (메모리, 파일) -> -1은 크기 지정을 하지 않음.
UploadSave upload = new UploadSave(request, -1, -1, tempDir);


//한글처리가 안됌. ->uploadSave 객체를 사용하고 있기때문에
//String title = upload.getParameter("title");
//String content = upload.getParameter("content");
//String etc = upload.getParameter("etc");

//한글처리 가능
String title = UploadSave.encode(upload.getParameter("title"));
String content = UploadSave.encode(upload.getParameter("content"));
String etc = UploadSave.encode(upload.getParameter("etc"));


//file이 객체형식으로 되면서 item이 그걸 참조 --->form의 file의 name값을 받음
FileItem fileItem = upload.getFileItem("filename");
//size도 받을수 있음.
int size = (int)fileItem.getSize();
//파일명을 얻어옴.
String filename = UploadSave.saveFile(fileItem, upDir);
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>test</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<div class ="well well-lg">
title: <%=title %><br>
content: <%=content %><br>
etc: <%=etc %><br>
filename: <%=filename %><br>
file size: <%=size %><br>
</div>
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">등록</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</div>
</body> 
</html> 