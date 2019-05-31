<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_bbs.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>
<jsp:setProperty name="dto" property="*"/>
<% 
//증가
Map map = new HashMap();
map.put("grpno",dto.getGrpno());
map.put("ansnum",dto.getAnsnum());
dao.upAnsnum(map);//부모의 ansnum, gpron

   boolean flag=dao.createReply(dto);

%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>게시판 답변처리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<div class="well well-lg">
<%
   if(flag){
	   out.print("글 답변 성공입니다.");
   }else{
	   out.print("글 답변 실패입니다.");
   }

%>
</div>
<button class="btn" type="button" onclick="location.href='./createForm.jsp'">다시등록</button>
<button class="btn" type="button" onclick="location.href='./list.jsp'">목록</button>
</div>
</body> 
</html>



 