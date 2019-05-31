<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_bbs.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
<style type="text/css">
*{
font-family:굴림체;
font-size:24px
}
</style>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">제목</h1>
<form class="form-horizontal" 
      action="./upload_multi_proc.jsp"
      method="post"
      enctype="multipart/form-data"
      >
      
     ① 파일: <input type="file" name="file1" size="50"><br>
     ② 파일: <input type="file" name="file2" size="50"><br>
     ③ 파일: <input type="file" name="file3" size="50"><br>
      
     파일설명: <input type="text" name="title" size="50" value="시원한 설악산 계곡"><br>
     <input type="submit" value="전송">
     
</form>
</div>
</body> 
</html> 