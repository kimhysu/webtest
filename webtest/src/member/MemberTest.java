package member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class MemberTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MemberDAO dao = new MemberDAO();
		
		//list(dao);
		//total(dao);
		read(dao);
	}
	
	private static void read(MemberDAO dao) {
		// TODO Auto-generated method stub
		MemberDTO dto = dao.read("user1");
		p(dto);
	}

	private static void total(MemberDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "개");
		p("전체 레코드 갯수: "+ dao.total(map));
	}

	private static void list(MemberDAO dao) {
		// TODO Auto-generated method stub
	Map map = new HashMap();
	map.put("col", "mname");
	map.put("word", "개");
	map.put("sno", 1);
	map.put("eno", 5);
	List<MemberDTO> list= dao.list(map);
	Iterator<MemberDTO> iter = list.iterator();
	
	while(iter.hasNext()) {
	MemberDTO dto = iter.next();
		p(dto);
		p("----------");
		}
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void p(MemberDTO dto) {
		// TODO Auto-generated method stub
		p("아이디: " + dto.getId());
		p("이름: " + dto.getMname());
		p("이메일: " + dto.getEmail());
		p("전화번호: " + dto.getTel());
		p("직업: " + dto.getJob());
		p("우편번호: " + dto.getZipcode());
		p("주소: " + dto.getAddress1());
		p("상세주소: " + dto.getAddress2());
	}

}
