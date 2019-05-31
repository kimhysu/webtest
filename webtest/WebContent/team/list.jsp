<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_team.jsp" %> 
<jsp:useBean id="dao" class="team.TeamDAO"/>
<%
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));

if(col.equals("total")){
word="";
}

int nowPage=1;
if(request.getParameter("nowPage")!=null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

int recordPerPage =3;
int sno=((nowPage-1)*recordPerPage)+1;
int eno = nowPage * recordPerPage;
Map map = new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", sno);
map.put("eno", eno);

int total = dao.total(map);
List<TeamDTO> list = dao.list(map);
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
<script type="text/javascript">
function read(teamno){
  var url = "read.jsp";
  url+="?teamno="+teamno;
  url +="&col=<%=col%>";
  url +="&word=<%=word%>";
  url +="&nowPage=<%=nowPage%>";
  location.href=url;
}

function update(teamno){
  var url ="updateForm.jsp";
  url+="?teamno="+teamno;
  url +="&col=<%=col%>";
  url +="&word=<%=word%>";
  url +="&nowPage=<%=nowPage%>";
  location.href=url;
}

function del(teamno){
  if(confirm("정말 삭제하시겠습니까?")){
    var url ="deleteProc.jsp";
    url+="?teamno="+teamno;
    url +="&col=<%=col%>";
    url +="&word=<%=word%>";
    url +="&nowPage=<%=nowPage%>";
    location.href=url;
  } 
}
</script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
 <h2>팀 목록</h2>
 <form class="form-inline" action="./list.jsp">
    <div class="form-group">
    <select class="form-control" name="col">
      <option value="name"
      <%if(col.equals("name"))
        out.print("selected");%>
      >성명</option>
      <option value="phone"
      <%if(col.equals("phone"))
        out.print("selected");%>
      >폰번호</option>
      <option value="skill"
      <%if(col.equals("skill"))
        out.print("selected");%>
      >스킬</option>
      <option value="total"
      <%if(col.equals("total"))
        out.print("selected");%>
      >전체출력</option>
    </select>
    </div>
    <div class="form-group">
    <input type="text" class="form-control" placeholder="Enter 검색어" 
    name="word" value="<%=word%>">
    </div>
    <button type="submit" class="btn btn-default">검색</button>
    <button type="button" class="btn btn-default" onclick="location.href='createForm.jsp'">등록</button>
    </form>
  <table class="table table-striped">
   <thead>
    <tr>
    <th>번호</th>
    <th>이름</th>
    <th>전화번호</th>
    <th>보유기술</th>
    <th>수정/삭제</th>    
    </tr>
   </thead>
   <tbody>
  <%
  if(list.size()==0){
 
  %>
  <tr> 
  <td colspan="5">등록된 팀정보가 없습니다.</td>
  </tr>
  <%}else{
	  for(int i=0; i<list.size(); i++){
		  TeamDTO dto = list.get(i);
	  %>
   <tr>
   <td><%=dto.getTeamno() %></td>
   <td><a href="javascript:read('<%=dto.getTeamno()%>')"><%=dto.getName() %></a></td>
   <td><%=dto.getPhone() %></td>
   <td><%=dto.getSkillstr() %></td>
   <td><a href="javascript:update('<%=dto.getTeamno()%>')">수정</a>/
   <a href="javascript:del('<%=dto.getTeamno()%>')">삭제</a></td>
   </tr>
   
   <%
	  }//for_end
  }//if_end
   %>
   </tbody>
   </table>
  <%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
</div>
</body> 
</html> 