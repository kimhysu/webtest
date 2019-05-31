<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_project.jsp"%>
<jsp:useBean id="dao" class="project.ProjectDAO"></jsp:useBean>
<%
int imgno = Integer.parseInt(request.getParameter("imgno")); 

	ProjectDTO dto = dao.read(imgno);
%>
<!DOCTYPE html>
<html>
<head>
<title>수정</title>
<meta charset="utf-8">
<script type="text/javascript">
  function incheck(f) {
    if (f.title.value == "") {
      alert('아이뒤를 입력해주세요');
      f.title.focus();
      return false;
    }

    if (f.content.value == "") {
      alert('내용를 입력해주세요');
      f.content.focus();
      return false;
    }
  }
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">제목</h1>
		<form class="form-horizontal" name="frm" action="updateProc.jsp"
			method="post" onsubmit="return incheck(this)">

			<input type="hidden" name="imgno" value="<%=imgno%>"> 
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="title"><span
					id="need">*</span>제목</label>
				<div class="col-sm-3">
					<input type="text" name="title" id="title" class="form-control"
						value="<%=dto.getTitle()%>">
				</div>
			</div>
			
			<div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-6">
    <textarea rows="5" cols="5" id="content" name="content" class="form-control"><%=dto.getContent()%></textarea>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>  

<div class="form-group">
        <label class="control-label col-sm-2" for="id">날짜</label>
        <div class="col-sm-3">
          <%=dto.getWdate()%>
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
