<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name='frm' method='post' action='./proc3.jsp'> 
  희망하는 근무 지역은?<br> 
  <input type='radio' name='area' value='서울' checked="checked"> 서울 지역 
  <input type='radio' name='area' value='인천'> 인천 지역 
  <input type='radio' name='area' value='경기'> 경기 지역 
  <input type='radio' name='area' value='충청북도'> 충청 지역 
  <input type='radio' name='area' value='강원도'> 강원 지역 
  <HR> 
  취미 선택 1<br> 
  <input type="checkbox" name='hobby1' value='독서'> 독서 
  <input type="checkbox" name='hobby2' value='등산'> 등산 
  <input type="checkbox" name='hobby3' value='영화'> 영화 
  <HR> 
  취미 선택 2<br> 
  <input type='checkbox' name='hobby' value='자전거'> 자전거 
  <input type="checkbox" name='hobby' value='캠핑'> 캠핑 
  <input type="checkbox" name='hobby' value='승마'> 승마 
  <input type="checkbox" name='hobby' value='스노우보드'> 스노우 보드 
  <input type="checkbox" name='hobby' value='바다낚시'> 바다낚시 
  <input type="checkbox" name='hobby' value='주말농장'> 주말농장   
  <br><br> 
  <input type='submit' value='등록'> 
</form>
</body>
</html>