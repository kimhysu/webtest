<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/ssi/ssi_guestbook.jsp"%>
<jsp:useBean id="dao" class="guestbook.GuestBookDAO"></jsp:useBean>
<%
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));

if(col.equals("total")) word="";

int nowPage =1;
if((request.getParameter("nowPage"))!=null){
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
List<GuestBookDTO> list = dao.list(map);
%>
<!DOCTYPE html>
<html>
<head>
<title>방명록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
function read(no){
	var url = "read.jsp";
	url +="?no="+no;
	location.href=url;
}
function update(no){
	var url ="updateForm.jsp";
	url +="?no="+no;
	location.href=url;
}
function del(no){
	if(confirm("정말 삭제 하시겠습니까?")){
		var url ="deleteProc.jsp";
		url +="?no="+no;
		location.href = url;
	}
}
</script>
<style type="text/css">


</style>
</head>
<body>

	<div class="container">
		<h2>게시판 목록</h2>
		<br>
		<form class="form-inline" action="./list.jsp">
		<div class="form-group">
		<select class="form-control" name="col">
		  <option value="name"
		  <%if(col.equals("name")) out.print("selected");%>
		  >성명</option>
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
		<input type="text" class="form-control" placeholder="Enter 검색어" name="word" value="<%=word%>">
		</div>
		<button type="submit" class="btn btn-default">검색</button>
		<button type="button" class="btn btn-default" onclick="location.href='creatForm.jsp'">등록</button>
		</form>
		<table class="table table-striped">
			<thead align="center">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>관계</th>
					<th>날짜</th>
					<th>grpno</th>
					<th>indent</th>
					<th>ansnum</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
					if (list.size() == 0) {
				%>
				<tr>
					<td colspan="5">등록된 방명록이 없습니다.</td>
				</tr>
				<%
					} else {
						for (int i = 0; i < list.size(); i++) {
							GuestBookDTO dto = list.get(i);
				%>
				<tr>
					<td><%=dto.getNo()%></td>
					<!-- 이름은 누르면 read로 이동하여 이름에 해당하는 내용이 보여지도록 -->
					<td>
					<%for(int r=0; r<dto.getIndent(); r++) {
						if(dto.getIndent()>0){
							out.print("&nbsp&nbsp");
							out.print("<img src='../images/re.jpg'>");
						}
						}
					%>
					<a href="javascript:read('<%=dto.getNo()%>')"><%=dto.getTitle()%></a></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getPartstr()%></td>					
					<td><%=dto.getRegdate() %></td>
					<td><%=dto.getGrpno() %></td>
					<td><%=dto.getIndent() %></td>
					<td><%=dto.getAnsnum() %></td>
					<td><a href="javascript:update('<%=dto.getNo() %>')">수정/</a>
						<a href="javascript:del('<%=dto.getNo() %>')">삭제</a>
					</td>
				</tr>
				<%
				}
			}
			%>
			</tbody>
		</table>
		<%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
	</div>

</body>
</html>