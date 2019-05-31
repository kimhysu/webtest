<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_bbs.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<% 
int bbsno = Integer.parseInt(request.getParameter("bbsno"));
BbsDTO dto = dao.read(bbsno);
dao.upViewcnt(bbsno);
String content = dto.getContent().replaceAll("\r\n", "<br>");
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
<script type="text/javascript">

function listBbsno(){
  var url="list.jsp";
  url +="?col=<%=request.getParameter("col")%>";
  url +="&word=<%=request.getParameter("word")%>";
  url +="&nowPage=<%=request.getParameter("nowPage")%>";
  location.href=url;
}
function updateBbsno(){
  var url = "updateForm.jsp";
  url += "?bbsno=<%=dto.getBbsno()%>";
  url +="&col=<%=request.getParameter("col")%>";
  url +="&word=<%=request.getParameter("word")%>";
  url +="&nowPage=<%=request.getParameter("nowPage")%>";
  location.href=url;
}
function delBbsno(){
  var url = "deleteForm.jsp";
  url += "?bbsno=<%=dto.getBbsno()%>";
  url +="&col=<%=request.getParameter("col")%>";
  url +="&word=<%=request.getParameter("word")%>";
  url +="&nowPage=<%=request.getParameter("nowPage")%>";
  location.href=url;
}
function replyBbsno(){
  var url = "replyForm.jsp";
  url += "?bbsno=<%=dto.getBbsno()%>";
  url +="&col=<%=request.getParameter("col")%>";
  url +="&word=<%=request.getParameter("word")%>";
  url +="&nowPage=<%=request.getParameter("nowPage")%>";
  location.href=url;
}
</script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">게시판 상세정보</h1>
<div class="panel panel-default">
<div class="panel-heading">번호</div>
<div class="panel-body"><%=dto.getBbsno()%></div>
<div class="panel-heading">제목</div>
<div class="panel-body"><%=dto.getTitle()%></div>
<div class="panel-heading">작성자</div>
<div class="panel-body"><%=dto.getWname()%></div>
<div class="panel-heading">내용</div>
<div class="panel-body"><%=dto.getContent()%></div>
<div class="panel-heading">조회수</div>
<div class="panel-body"><%=dto.getViewcnt()%></div>
<div class="panel-heading">날짜</div>
<div class="panel-body"><%=dto.getWdate()%></div>
</div>
<button class="btn" type="button" onclick="location.href='createForm.jsp'">등록</button>
<button class="btn" type="button" onclick="updateBbsno()">수정</button>
<button class="btn" type="button" onclick="delBbsno()">삭제</button>
<button class="btn" type="button" onclick="replyBbsno()">답변</button>
<button class="btn" type="button" onclick="listBbsno()">목록</button>
</div>
</body> 
</html> 