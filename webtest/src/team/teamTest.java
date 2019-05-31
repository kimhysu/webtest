package team;

import java.util.Iterator;
import java.util.List;

public class teamTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TeamDAO dao = new TeamDAO();
		//creat(dao);
//		read(dao);
//		update(dao);
//		delete(dao);
		list(dao);
	}

	private static void list(TeamDAO dao) {
		// TODO Auto-generated method stub
		List<TeamDTO> list = dao.list();
		
		Iterator<TeamDTO> iter = list.iterator();
		while(iter.hasNext()) {
			TeamDTO dto = iter.next();
			p(dto);
			p("-----------------");
		}
	}

	private static void delete(TeamDAO dao) {
		// TODO Auto-generated method stub
		if(dao.delete(1)) {
			p("성공");
		}else
			p("실패");
	}

	private static void update(TeamDAO dao) {
		// TODO Auto-generated method stub
		TeamDTO dto = dao.read(1);
		dto.setPhone("000-0000-0000");
		dto.setHobby("음악듣기");
		dto.setZipcode("0000");
		dto.setSkill("Spring");
		dto.setAddress1("서울");
		dto.setAddress2("강남");
		
		if(dao.update(dto))
			p("성공");
		else
			p("실패");
	}

	private static void read(TeamDAO dao) {
		// TODO Auto-generated method stub
		TeamDTO dto = dao.read(1);
		p(dto);
	}

	private static void p(TeamDTO dto) {
		// TODO Auto-generated method stub
		p("번호: "+dto.getTeamno());
		p("이름: "+dto.getName());
		p("전화번호: "+dto.getPhone()); 
		p("보유기술: "+dto.getSkill());
		p("취미: "+dto.getHobby());
		p("성별: "+dto.getGender());
		p("우편번호: "+dto.getZipcode());
		p("주소: "+dto.getAddress1());
		p("상세주소: "+dto.getAddress2());
	}

	private static void creat(TeamDAO dao) {
		// TODO Auto-generated method stub
		TeamDTO dto = new TeamDTO();
		dto.setName("왕눈이");
		dto.setPhone("010-7777-7777");
		dto.setGender("남자");
		dto.setSkill("JAVA");
		dto.setHobby("영화보기");
		dto.setZipcode("12345");
		dto.setAddress1("서울시 강남구 서초동");
		dto.setAddress2("영동빌딩 10층");
		
		if(dao.create(dto))
			p("성공");
		else
			p("실패");
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

}
