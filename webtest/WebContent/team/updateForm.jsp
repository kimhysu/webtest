<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_team.jsp"%>
<jsp:useBean id="dao" class="team.TeamDAO"/>
<%
int teamno = Integer.parseInt(request.getParameter("teamno"));
TeamDTO dto = dao.read(teamno);
 String skill = dto.getSkillstr();
 %>
<!DOCTYPE html> 
<html> 
<head>
  <title>팀정보생성</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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

</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">팀 정보 수정</h1>

<form class="form-horizontal" method="post" action="updateProc.jsp" name="frm">
<input type="hidden" name="teamno" value="<%=dto.getTeamno()%>">
  <input type="hidden" name="col" value="<%=request.getParameter("col")%>">
      <input type="hidden" name="word" value="<%=request.getParameter("word")%>">
      <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">

 <div class="form-group">
  <label class="control-label col-sm-2" for="name">이름</label>
  <div class="col-sm-4">
    <%=dto.getName() %>
  </div>
 </div>
 <div class="form-group">
  <label class="control-label col-sm-2" for="phone">전화번호</label>
  <div class="col-sm-3">
    <input type="text" class="form-control" id="phone" value="<%=dto.getPhone() %>" name="phone">
  </div>
 </div>
 <div class="form-group">
 <label class="control-label col-sm-2">성별</label>
 <div class="col-sm-10">
   <%= dto.getGender() %>
 </div>
 </div>
 
 <div class="form-group">
 <label class="control-label col-sm-2">보유기술</label> 
 <div class="col-sm-10">
    <label class="checkbox-inline">
      <input type="checkbox" name="skill" value="JAVA" 
    <% if(skill.indexOf("JAVA")!=-1) out.print("checked"); //JAVA 체크를 했다면0%>
    >JAVA
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" name="skill" value="JSP"
      <% if(skill.indexOf("JSP")!=-1) out.print("checked");%>
      >JSP
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" name="skill" value="MVC"
      <% if(skill.indexOf("MVC")!=-1) out.print("checked");%>
      >MVC
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" name="skill" value="SPRING"
       <% if(skill.indexOf("SPRING")!=-1) out.print("checked");%>
      >SPRING
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" name="skill" value="JQUERY"
       <% if(skill.indexOf("JQUERY")!=-1) out.print("checked");%>
      >JQUERY
    </label>
 </div>
 </div>
 <div class="form-group">
 <label class="control-label col-sm-2">취미</label> 
 <div class="col-sm-3">
 <select class="form-control" name="hobby">
        <option>취미를 선택하세요</option>
        <option value="영화보기">영화보기</option>
        <option value="기술서적 읽기">기술서적 읽기</option>
        <option value="보드타기">보드타기</option>
        <option value="음악듣기">음악듣기</option>
        <option value="TV보기">TV보기</option>       
 </select>
 <script type="text/javascript">
 document.frm.hobby.value='<%=dto.getHobby()%>';
 </script>
 </div>
 </div>
 
 <div class="form-group">
 <label class="control-label col-sm-2">우편번호</label> 
 <div class="col-sm-2">
 <input type="text" class="form-control" name="zipcode" 
 maxlength="5" id="sample6_postcode" placeholder="우편번호">
 </div>
 <div class="col-sm-4">
  <button type="button" class="btn" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
 </div> 
 </div>  
 
 <div class="form-group">
  <label class="control-label col-sm-2">주소</label>
  <div class="col-sm-8">
  <input type="text" class="form-control" name="address1" 
  value="<%=dto.getAddress1() %>" id="sample6_address">
  <input type="text" class="form-control" name="address2" 
  value="<%=dto.getAddress2()%>" id="sample6_detailAddress">  
  </div>
 </div>

 <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">수정</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>

</form>


</div>
</body> 
</html> 