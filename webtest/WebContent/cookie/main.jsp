<%@ page contentType="text/html; charset=UTF-8" %> 

<%
String windowOpen = "open";

Cookie[] cookies = request.getCookies();

Cookie cookie = null;

if(cookies!=null){
	for(int i=0; i<cookies.length; i++){
		cookie = cookies[i];
		if(cookie.getName().equals("windowOpen")){
			windowOpen = cookie.getValue();
		}
	}
}
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
<script type="text/javascript">
window.onload = function(){
notice();
}
function notice(){
  if("<%=windowOpen%>" == "close"){
    alert("공지사항 창 열지 않음.")
  }else{
    var url ="./notice.jsp";
    window.open(url,'공지사항',"left=10,top=40,width=450,height=300")
  }
}

function openNotice(){
  var url = "./notice.jsp";
  window.open(url,'공지사항',"left=10,top=40,width=450,height=300");
}
</script>
</head>
<body> 
<div class="content">
오늘은 수요일 입니다.<br><br>
평창동계 올림픽 발표 17:00
[<a href="javascript:openNotice()">새로운공지사항보기 </a>]
</div>
</body> 
</html> 