<%@ page contentType="text/html; charset=UTF-8" %> 
<%
   //client 안에 있는 모든 쿠키를 전부 읽어 옵니다.
   
   Cookie[] cookies = request.getCookies();
   Cookie cookie = null;
   
   String sw = null;
   
   if(cookies != null){
	   for(int i=0; i<cookies.length; i++){
		   //쿠키 변수를 각가 추출합니다.
		   cookie = cookies[i];
		   
		   if(cookie.getName().equals("sw")){
			   sw =  cookie.getValue();
		   }
	   }
   }
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>접속 환영</title>
  <link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<body> 
 <div class='content'>
  <%
     if(sw != null){ // cookie 변수가 있다면
    	 out.println("재접속을 환영합니다." + "<br>");
     }else{
    	 out.println("처음 접속 하셨군요~~~" + "<br>");
    	 
    	 Cookie wcookie = null;
    	 
    	 wcookie = new Cookie("sw","1"); //한글 저장시 에러
    	 wcookie.setMaxAge(60);          //60초
    	 
    	 response.addCookie(wcookie);    //cookie를 client에 저장합니다.
     }
  %>
  
  <br><br>
  <a href='http://172.16.81.115:8000/blog/cookie/welcome.jsp'>Server좁속</a>
 </div>
</body> 
</html>