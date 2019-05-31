<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
upDir="/member/storage";
tempDir="/member/temp";

upDir = application.getRealPath(upDir);
tempDir = application.getRealPath(tempDir);

UploadSave upload = new UploadSave(request, -1, -1, tempDir);

String id = UploadSave.encode(upload.getParameter("id"));
String email = UploadSave.encode(upload.getParameter("email"));

String str ="";

if(dao.duplicateId(id)){
	str = "중복된 아이뒤 입니다.";
}else if(dao.duplicateEmail(email)){
	str = "중복된 이메일 입니다.";
}else{
	//createProc.jsp이동해서 db에 회원정보를 저장한다.
	request.setAttribute("upload", upload);
	%> 
	  <jsp:forward page="/member/createProc.jsp"/>
	 
	<%
	    return; //더이상 body부분이 보여지지 않게 return;
	}
	%>
<!DOCTYPE html> 
<html> 
<head>
  <title>id 및 email중복확인</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
  <div class="well well-lg">
   <%=str %>
   </div>
   <br>
     <button class="btn" type='button'  onclick="history.back()">다시시도</button>
 </div>
</body> 
</html> 