<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head>
  <title>이미지 등록</title>
  <meta charset="utf-8">
<script type="text/javascript">
function incheck(f){
  if(f.title.value==""){
    alert('제목를 입력해주세요');
    f.title.focus();
    return false;
  }
  if(f.mname.value==""){
    alert('이름을 입력해주세요');
    f.mname.focus();
    return false;
  }
  if(f.content.value==""){
    alert('내용을 입력해주세요');
    f.content.focus();
    return false;
  }

  if(f.passwd.value==""){
    alert('비밀번호를 입력해주세요');
    f.passwd.focus();
    return false;
  }
  if(f.repasswd.value==""){
    alert('비밀번호 확인을 입력해주세요');
    f.repasswd.focus();
    return false;
  }
  if(f.fname.value==""){
    alert('이미지를 선택해주세요.');
    return false;
  }
  if(f.passwd.value!=f.repasswd.value){
    alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
    f.passwd.focus();
    return false;
  }
  
}
</script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">이미지 등록</h1>
<form class="form-horizontal" 
      action="createProc.jsp"
      method="post"
      enctype="multipart/form-data"
      onsubmit = "return incheck(this)"
      name="frm"
      >

  <div class="form-group">
    <label class="control-label col-sm-2" for="title"><span id="need">*</span>제목</label>
    <div class="col-sm-6">
      <input type="text" name="title" id="title" class="form-control">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="mname"><span id="need">*</span>이름</label>
    <div class="col-sm-6">
      <input type="text" name="mname" id="mname" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content"><span id="need">*</span>내용</label>
    <div class="col-sm-6">
    <textarea rows="5" cols="5" id="content" name="content" class="form-control"></textarea>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd"><span id="need">*</span>비밀번호</label>
    <div class="col-sm-4">
    <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="repasswd"><span id="need">*</span>비밀번호 확인</label>
    <div class="col-sm-4">
    <input type="password" name="repasswd" id="repasswd" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="fname">파일</label>
    <div class="col-sm-6">
    <input type="file" name="fname" id="fname" accept=".jpg, .gif, .png" class="form-control">
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