<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_project.jsp"%>
<jsp:useBean id="dao" class="project.ProjectDAO" />
<%
int imgno = Integer.parseInt(request.getParameter("imgno"));
String passwd = request.getParameter("passwd");
  //패스워드검증
  Map map = new HashMap();
  map.put("imgno", imgno);
  map.put("passwd", passwd);
  boolean flag = false;
  boolean pflag = dao.passCheck(map);
  
  if(pflag)//pflag가 true라면
    flag = dao.delete(imgno); //update를 실행
%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<script type="text/javascript">
function listImgno(){
  var url ="list.jsp";
  url += "?col=<%=request.getParameter("col")%>";
  url += "&word=<%=request.getParameter("word")%>";
  url += "&nowPage=<%=request.getParameter("nowPage")%>";
  location.href=url;
}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">글삭제</h1>
		<div class="well well-lg">
      <%
        if (!pflag) {
          out.print("잘못된 비밀번호입니다.");
        } else if(flag){
          out.print("글 삭제를 성공했습니다.");
        }else{
          out.print("글 삭제를 실패했습니다.");
        }
      %>
    </div>
    <%
    if(!pflag){
    %>
    <button class="btn" type="button"
      onclick="history.back()">다시시도</button>
    <%} %>
		<button class="btn" onclick="listImgno()">홈</button>
		<button type="reset" class="btn" onclick="history.back()">다시시도</button>
	</div>
</body>
</html>
