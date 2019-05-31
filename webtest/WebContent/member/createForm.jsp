<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <!-- jquery에 필요한 부분 start -->
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
  <script src="<%=request.getContextPath()%>/js/ajaxsetup.js"></script>
  <!-- jquery에 필요한 부분 end -->
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
  function sample6_execDaumPostcode() {
    new daum.Postcode({
      oncomplete : function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
          addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if (data.userSelectedType === 'R') {
          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            extraAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
                : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if (extraAddr !== '') {
            extraAddr = ' (' + extraAddr + ')';
          }

        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('sample6_postcode').value = data.zonecode;
        document.getElementById("sample6_address").value = addr;
        // 커서를 상세주소 필드로 이동한다.
        document.getElementById("sample6_detailAddress").focus();
      }
    }).open();
  }
</script>
<style type="text/css">
#need{
color:red;
}
#idcheck{
color:red;
}
#emailcheck{
color:red;
}
</style>
<script type="text/javascript">
function incheck(f){
  if(f.id.value==""){
    alert('아이디를 입력해주세요');
    f.id.focus();
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
  if(f.passwd.value!=f.repasswd.value){
    alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
    f.passwd.focus();
    return false;
  }if(f.mname.value==""){
    alert('이름을 입력해주세요');
    f.mname.focus();
    return false;
  }
  if(f.email.value==""){
    alert('이메일을 입력해주세요');
    f.email.focus();
    return false;
  }
  if(f.tel.value==""){
    alert('전화번호를 입력해주세요');
    f.id.focus();
    return false;
  }
  if(f.job.selectedIndex==0){
    alert('작업을 선택하세요');
    f.job.focus();
    return false;
  }
}

function idCheck(id){
  if(id==""){
    alert('아이디를 입력해주세요');
    document.frm.id.focus();
  }else{
    var url = "idcheck.jsp";
    var param = "id="+id;
    $.get(
        url,
        param,
        function(data, textStatus) {
          $("#idcheck").text(data);
     }
   );
  }
}

function emailCheck(email){
  if(email==""){
    alert('이메일를 입력해주세요');
    document.frm.email.focus();
  }else{
    var url = "emailcheck2.jsp";
    var param = "email="+email;
    $.get(
        url,
        param,
        function(data, textStatus) {
          $("#emailcheck").text(data);
     }
   );
  }
}
</script>
</head>
<body> 
<jsp:include page="/menu/top_jquery.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">회원가입</h1>
<label class="col-sm-offset-2 col-sm-10">(<span id="need">*</span> 는 필수 입력 사항입니다.)</label>
<form class="form-horizontal" 
      action="precreateProc.jsp"
      method="post"
      enctype="multipart/form-data"
      onsubmit = "return incheck(this)"
      name="frm"
      >

  <div class="form-group">
    <label class="control-label col-sm-2" for="fname">사진</label>
    <div class="col-sm-6">
      <input type="file" name="fname" id="fname" accept=".jpg, .gif, .png" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="id"><span id="need">*</span>아이디</label>
    <div class="col-sm-3">
    <input type="text" name="id" id="id" class="form-control">
    </div>
    <button class="btn col-sm-2" type="button" onclick="idCheck(document.frm.id.value)">ID중복확인</button>
    <div id="idcheck"></div>
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
    <label class="control-label col-sm-2" for="mname"><span id="need">*</span>성명</label>
    <div class="col-sm-4">
    <input type="text" name="mname" id="mname" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="tel"><span id="need">*</span>전화번호</label>
    <div class="col-sm-4">
    <input type="text" name="tel" id="tel" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="email"><span id="need">*</span>Email 중복 확인</label>
    <div class="col-sm-4">
    <input type="text" name="email" id="email" class="form-control">
    </div>
    <button  type="button" class="btn col-sm-2" onclick="emailCheck(document.frm.email.value)">Email중복확인</button>
  <div id="emailcheck"></div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="sample6_postcode">우편번호</label>
    <div class="col-sm-4">
    <input type="text" name="zipcode" id="sample6_postcode" class="form-control">
    </div>
    <button class="btn col-sm-2" type="button" onclick="sample6_execDaumPostcode()">주소검색</button>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="sample6_address">주소</label>
    <div class="col-sm-4">
    <input type="text" name="address1"  class="form-control" placeholder="주소" id="sample6_address">
    <input type="text" name="address2" class="form-control" placeholder="상세주소" id="sample6_detailAddress">
    </div>
  </div>
  
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="job">직업</label>
    <div class="col-sm-2">
     <select name="job" class="form-control">
       <option value="0">선택하세요</option>
       <option value="A01">회사원</option>
       <option value="A02">전산관련직</option>
       <option value="A03">연구전문직</option>
       <option value="A04">각종학교학생</option>
       <option value="A05">일반자영업</option>
       <option value="A06">공무원</option>
       <option value="A07">의료인</option>
       <option value="A08">법조인</option>
       <option value="A09">종교/언론/예술인</option>
       <option value="A10">기타</option>      
      </select>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="filename">파일</label>
    <div class="col-sm-6">
      <input type="file" name="filename" id="filename" class="form-control">
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