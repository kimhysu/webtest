<%@page import="project.ProjectDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_project.jsp"%>
<jsp:useBean id="dao" class="project.ProjectDAO" />
<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if (col.equals("total")) {
		word = "";
	}
	int nowPage = 1;
	int recordPerPage = 3;

	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	int total = dao.total(map);
	List<ProjectDTO> list = dao.list(map);
	String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<script type="text/javascript">
function read(imgno){
  var url = "read.jsp";
  url += "?imgno="+imgno;
  url+="&col=<%=col%>";
  url+="&word=<%=word%>";
  url+="&nowPage=<%=nowPage%>";
  location.href=url;
}

</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container">
		<form class="form-inline" action="./list.jsp">
			<select class="form-control" name="col">
				<option value="mname"
					<%if (col.equals("mname"))
				out.print("selected");%>>성명</option>
				<option value="title"
					<%if (col.equals("title"))
				out.print("selected");%>>제목</option>
				<option value="title_content"
					<%if (col.equals("title_content"))
				out.print("selected");%>>제목+내용</option>
				<option value="total"
					<%if (col.equals("total"))
				out.print("selected");%>>전체출력</option>
			</select>
			<div class="form-group">
				<input type="text" name="word" class="form-control"
					placeholder="Enter 검색어" value="<%=word%>">
				<button type="submit" class="btn">검색</button>
			</div>
		</form>
		<%
		for(int i=0; i<list.size(); i++){
		ProjectDTO dto = list.get(i);	
		
		%>
		<table>
		<tr>
		<td rowspan="5">
		<img src = "./storage/<%=dto.getFname()%>" width="150" hieght="150">
		</td>
		</tr>
		 <tr>
      <th>성명</th>
      <td><%=dto.getMname() %></td>
    </tr>
		 <tr>
      <th>제목</th>
      <td><a href="javascript:read('<%=dto.getImgno()%>')"><%=dto.getTitle() %></a></td>
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
		<%}%>
		<%=paging %>
	</div>
</body>
</html>
