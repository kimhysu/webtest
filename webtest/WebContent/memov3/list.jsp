<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<% 
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));

if(col.equals("total")){
word="";
}
int nowPage =1;
if(request.getParameter("nowPage")!=null){
nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

int recordPerPage =3;
int sno = ((nowPage-1)*recordPerPage)+1;
int eno = nowPage * recordPerPage;

Map map = new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", sno);
map.put("eno", eno);

int total = dao.total(map);
  List<MemoDTO> list = dao.list(map);
%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>팀 목록</title>
  <meta charset="utf-8">
  <script type="text/javascript">
    function read(memono){
    var url = "read.jsp";
    url+="?memono="+memono;
    url +="&col=<%=col%>";
    url +="&word=<%=word%>";
    url +="&nowPage=<%=nowPage%>";
    location.href=url;
    }
  </script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">

  <h2>메모 목록</h2>
  <br>
  <form class="form-inline" method="post" action="./list.jsp">
  <div class="form-group">
  <select class="form-control" name="col">
  <option value="title"
  <%if(col.equals("title")) out.print("selected"); %>
  >제목</option>
  <option value="content"
   <%if(col.equals("content")) out.print("selected"); %>
  >내용</option>
  <option value="title_content"
   <%if(col.equals("title_content")) out.print("selected"); %>
  >제목+내용</option>
  <option value="total"
   <%if(col.equals("total")) out.print("selected"); %>
  >전체출력</option>
  </select>
  </div>
  <div class="form-group">
  <input type="text" class="form-control" name="word" value="<%=word%>"> 
  </div>
  <button class="btn btn-default">검색</button>
  <button type="button" onclick="location.href='createForm.jsp'" class="btn btn-default">등록</button>
  
  </form>
  
  <table class="table table-striped">
   <thead>
    <tr>
    <th>번호</th>
    <th>제목</th>
    <th>날짜</th>
    <th>조회수</th>
    <th>grpno</th>
    <th>indent</th>
    <th>ansnum</th>
    </tr>
   </thead>
   <tbody>
  
<% if(list.size()==0){ %> 
   <tr><td colspan="7">등록된 메모가 없습니다.</td>

<% }else{  
for(int i=0;  i<list.size(); i++){
   MemoDTO dto = list.get(i);
 
%> 
   <tr>
    <td><%=dto.getMemono() %></td>
    <td>
    <%for(int r=0; i<dto.getIndent(); r++){
    out.print("&nbsp&nbsp");
    }if(dto.getIndent()>0){
    out.print("<img src='../images/re.jpg'>");
    }
    
     %>
    <a href="javascript:read('<%=dto.getMemono()%>')"><%=dto.getTitle() %></a></td>
    <td><%=dto.getWdate() %></td>
    <td><%=dto.getViewcnt() %></td>
    <td><%=dto.getGrpno() %></td>
    <td><%=dto.getIndent() %></td>
    <td><%=dto.getAnsnum() %></td>
    </tr>
<%
    } //for_end
  }//if_end
%>  
   </tbody>
  
  </table>
  <div>
   <%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
  </div>
</div>
</body> 
</html> 

