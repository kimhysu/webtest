<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.js"></script>
  <script src="<%=request.getContextPath()%>/js/ajaxsetup.js"></script>
  <script src="js/ajaxsetup.js">
  </script>
   <script type="text/javascript">
  function pwCheck(){
    if(id==""){
      alert('아이디를 입력해주세요');
      document.frm.id.focus();
    }else{
      var url = "findPwcheck.jsp";
      var param = $("#frm").serialize();
      $.get(
          url,
          param,
          function(data, textStatus) {
            $("#idcheck").text(data);
       }
     );
    }
  }
  </script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">제목</h1>
<form class="form-horizontal" 
      action="findIdcheck.jsp"
      method="post"
      name="frm"
      id="frm"
      >

  <div class="form-group">
    <label class="control-label col-sm-2" for="id">아이디</label>
    <div class="col-sm-6">
      <input type="text" name="id" id="id" class="form-control"  placeholder="user1">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">이메일</label>
    <div class="col-sm-6">
   <input type="email" name="email" id="email" class="form-control" placeholder="email1@mail.com">
    </div>
  </div>
  <div id="idcheck"></div>
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <input type="button"  class="btn" name='btnSubmit' id='btnSubmit' value='찾기' onclick='pwCheck()'/> 
    <button type="reset" class="btn" >취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 