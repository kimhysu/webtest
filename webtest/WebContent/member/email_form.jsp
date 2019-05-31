<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>email 중복확인</title>
  <meta charset="utf-8">
  <link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
#red {
color:red;
}
</style>
</head>
<body> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">email 중복확인</h1>
<form class="form-horizontal" 
      action="emailProc.jsp"
      method="post"
      >

  <p id="red" class="col-sm-offset-2 col-sm-10">이메일을 입력하세요</p>
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">이메일</label>
    <div class="col-sm-6">
      <input type="email" name="email" id="email" class="form-control">
    </div>
  </div>

   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">Email중복확인</button>
    <button type="button" onclick="window.close()" class="btn">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 