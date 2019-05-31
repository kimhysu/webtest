<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_member.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	System.out.println("id:" + id);
	System.out.println("pw:" + passwd);

	Map map = new HashMap();
	map.put("id", id);
	map.put("pw", passwd);

	boolean flag = dao.loginCheck(map);

	String grade = null; //회원 등급에 저장할 변수가 된다!

	if (flag) {
		grade = dao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);

		//쿠키저장
		Cookie cookie = null;

		String c_id = request.getParameter("c_id");

		if (c_id != null) {
			cookie = new Cookie("c_id", "Y");
			cookie.setMaxAge(120);
			response.addCookie(cookie);

			cookie = new Cookie("c_id_val", id);
			cookie.setMaxAge(120);
			response.addCookie(cookie);
		} else {
			cookie = new Cookie("c_id", "");//쿠키삭제
			cookie.setMaxAge(0);
			response.addCookie(cookie);

			cookie = new Cookie("c_id_val", "");//쿠키삭제
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	} else {
		out.print("id와 password가 일치 하지 않습니다.");
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>로그인 처리</title>
<meta charset="utf-8">

</head>
<body>

	<jsp:include page="/menu/top.jsp" />
	<div class="container">
		<h2 class="col-sm-offset-2 col-sm-10">로그인 처리</h2>

		<div class="well well-lg">
			<%
				if (flag) {
					out.print("로그인 되었습니다.");
				} else {
					out.print("아이디 또는 비밀번호를 잘 못 입력하셨거나 <br>");
					out.print("회원이 아닙니다.");
				}
			%>
		</div>
		<button class="btn" onclick="location.href='../index.jsp'">홈</button>
		<button class="btn" onclick="history.back()">다시시도</button>
	</div>

</body>
</html>