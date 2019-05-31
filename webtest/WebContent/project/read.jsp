<%@page import="project.ProjectDTO"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_project.jsp" %>
<jsp:useBean id="dao" class="project.ProjectDAO"/>
<%
int imgno = Integer.parseInt(request.getParameter("imgno"));
dao.upViewcnt(imgno);
ProjectDTO dto = dao.read(imgno);


%>
<!DOCTYPE html> 
<html> 
<head>
  <title>회원정보</title>
  <meta charset="utf-8">
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 

.curImg{
  margin-right:0;
  border-style:solid;
  border-width: 3px;
  border-color: red;
}
.td_padding{
  padding:5px 5px;
}

</style> 
<script type="text/javascript"> 
function readGo(imgno){
  var url = "./read.jsp";
  url += "?imgno="+imgno;
  
  location.href=url;
}
function filedown(){
  var url = "<%=root%>/download";
  url += "?dir=/project/storage";
  url += "&filename=<%=dto.getFname()%>";
  location.href=url;
}
function del(){
  var url = "deleteForm.jsp";
  url +="?imgno=<%=imgno%>";
  url +="&oldfile=<%=dto.getFname()%>";
  url +="&col=<%=request.getParameter("col")%>"
  url +="&word=<%=request.getParameter("col")%>"
  url +="&nowPage=<%=request.getParameter("nowPage")%>"
 
  location.href=url;
}
function update(){
  var url = "updateForm.jsp";
  url +="?imgno=<%=imgno%>";
   location.href=url;
}
function updateFile(){
  var url = "updateFileForm.jsp";
  url +="?imgno=<%=imgno%>";
  url +="&oldfile=<%=dto.getFname()%>";
  location.href=url;
}
function listM(){
  var url = "list.jsp";
  location.href=url;
}
</script>
</head>
<body > 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10"><%=dto.getMname() %>님의 회원정보</h1>
<table class="table table-bordered">
<tr>
<td colspan="2" style="width: 50%">
<img src="./storage/<%=dto.getFname() %>" width="50%" >
</td>
</tr>
<tr>
   <th>제목</th>
   <td><%=dto.getTitle() %></td>
 </tr>
<tr>
   <th>내용</th>
   <td><%=dto.getContent() %></td>
 </tr>
<tr>
   <th>이름</th>
   <td><%=dto.getMname() %></td>
 </tr>
<tr>
   <th>날짜</th>
   <td><%=dto.getWdate() %></td>
 </tr>
<tr>
   <th>조회수</th>
   <td><%=dto.getViewcnt() %></td>
 </tr>
</table>
<TABLE style="width: 50%">
<tr>
<%
List list = dao.imgRead(imgno);
String[] files = (String[])list.get(0);
int[] noArr = (int[])list.get(1);
for(int i=0; i<5; i++){
	if(files[i]==null){  
%>
 <td class="td_padding"><img src="./storage/default.jpg" width="100%"><td>
  <%    
        }else{
        	if(noArr[i]==imgno){
  %>
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img class="curImg" src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
  <%    
        }else{
  %>
   <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
        
  <%
        }
       }      
      }
  %>
  </TR>
  </TABLE>
<div style="text-align: center">
<button class="btn" onclick="update()">정보수정</button>
<button class="btn" onclick="del()">글삭제</button>
<button class="btn" onclick="updateFile()">사진수정</button>
<button class="btn" onclick="filedown()">다운로드</button>
<button class="btn" onclick="listM()">이미지목록</button>
</div>
</div>
</body> 
</html> 