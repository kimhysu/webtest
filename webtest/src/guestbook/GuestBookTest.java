package guestbook;

import java.util.HashMap;
import java.util.Map;

import team.TeamDTO;

public class GuestBookTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GuestBookDAO dao = new GuestBookDAO();
		
		//passwdCheck(dao);
		create(dao);
	}

	private static void create(GuestBookDAO dao) {
		// TODO Auto-generated method stub
		GuestBookDTO dto = new GuestBookDTO();
		
		dto.setGender("남자");
		dto.setTitle("제목");
		dto.setContent("내용");
		dto.setPartstr("분야");
		dto.setPasswd("1234");
		dto.setName("홍길동");
	
		if(dao.create(dto))
			p("성공");
		else
			p("실패");
	}

	private static void passwdCheck(GuestBookDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("no", 6);
		map.put("passwd", "12345");
		
		if(dao.passwdCheck(map))
			p("올바른 패스워드 입니다.");
		else
			p("잘못된 패스워드 입니다.");
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

}
