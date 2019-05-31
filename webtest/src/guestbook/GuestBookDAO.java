package guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class GuestBookDAO {
	//CRUDL   CRU - boolean    R - dto  L - list
	
	public int total(Map map) {
			int total =0;
			Connection con = DBOpen.open();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuffer sql = new StringBuffer();
			sql.append(" select count(*)  ");
			sql.append(" from guestbook  ");
		
		String col=(String)map.get("col");
		String word = (String)map.get("word");
		
		if(word.trim().length()>0 && col.equals("title_content")) {
			sql.append(" 	where title like '%'||?||'%' ");
			sql.append(" 	or content like '%'||?||'%' ");
			
		}else if(word.trim().length()>0) {
			sql.append("    where "+ col + " like '%'||?||'%' ");
		}try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0 && col.equals("title_content")) {
				pstmt.setString(1, word);
				pstmt.setString(2, word);
			}
			else if(word.trim().length()>0) {
				pstmt.setString(1, word);
			}
				rs = pstmt.executeQuery();
				if (rs.next()) {
					total = rs.getInt(1);
				}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}	
			return total;
	}
	//list
	public List<GuestBookDTO> list(Map map){
		List<GuestBookDTO> list = new ArrayList<GuestBookDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		sql.append(" select no, name, title, part, regdate, ");
		sql.append(" grpno, indent, ansnum, r ");
		sql.append("   from( ");
		sql.append("   select no, name, title, part, regdate, ");
		sql.append("   grpno, indent, ansnum, rownum r ");
		sql.append("      from( ");
		sql.append("      select no, name, title, part, to_char(regdate,'yyyy-mm-dd')regdate, ");
		sql.append("      grpno, indent, ansnum ");
		sql.append("      from guestbook ");
		if(word.trim().length()>0 && col.equals("title_content")) {			
			sql.append(" where title like '%'||?||'%' "); 
			sql.append(" or content like '%'||?||'%' "); 
		}else if(word.trim().length()>0) {
			sql.append(" where " + col + " like '%'||?||'%' "); 
		}
		sql.append(" order by grpno desc, ansnum asc ");
		sql.append("      )  ");
		sql.append("  )where r>=? and r<=?  ");
		
		try {
			int i =0;
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0 && col.equals("title_content")) {
				pstmt.setString(++i, word);
				pstmt.setString(++i, word);
			}else if(word.trim().length()>0) {
				pstmt.setString(++i, word);
			}
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GuestBookDTO dto = new GuestBookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setPartstr(rs.getString("part"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		return list;
	}
	
	//read
	public GuestBookDTO read(int no) {
		GuestBookDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select no,name,gender,title,content, part, to_char(regdate,'yyyy-mm-dd') regdate ");
		sql.append(" from guestbook ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs  = pstmt.executeQuery();
			
			if(rs.next()) {
				dto =new GuestBookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPartstr(rs.getString("part"));
				dto.setRegdate(rs.getString("regdate"));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
		
	}
	public GuestBookDTO readReply(int no) {
		GuestBookDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select no,title, grpno, ansnum, indent");
		sql.append(" from guestbook ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs  = pstmt.executeQuery();
			
			if(rs.next()) {
				dto =new GuestBookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setIndent(rs.getInt("indent"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
		
	}
	
	//create
	public boolean create(GuestBookDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into guestbook(no, name, gender, ");
		sql.append(" title, content, part, passwd, regdate, grpno) ");
		sql.append(" values(no_seq.nextval, ");
		sql.append(" ?, ?, ?, ?, ?, ?, sysdate, ");
		sql.append(" (select nvl(max(no),0)+1 from guestbook)) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getPartstr());
			pstmt.setString(6, dto.getPasswd());
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	public boolean createReply(GuestBookDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into guestbook(no, name, gender, ");
		sql.append(" title, content, part, passwd, regdate, grpno, indent, ansnum) ");
		sql.append(" values(no_seq.nextval, ");
		sql.append(" ?, ?, ?, ?, ?, ?, sysdate, ");
		sql.append(" (select nvl(max(no),0)+1 from guestbook), ?, ? ) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getPartstr());
			pstmt.setString(6, dto.getPasswd());
			pstmt.setInt(7, dto.getIndent()+1);//부모보다+1증가해야함
			pstmt.setInt(8, dto.getAnsnum()+1);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	//update
	public boolean update(GuestBookDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update guestbook ");
		sql.append(" set title = ?, ");
		sql.append(" 	 part = ?, ");
		sql.append("     content=? ");
		sql.append("where no = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getPartstr());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNo());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	//delete
	public boolean delete(int no) {
		boolean flag= false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from guestbook ");
		sql.append(" where no = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	//passwd check 
	public boolean passwdCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		
		int no = (Integer)map.get("no");
		String passwd = (String)map.get("passwd");
		
		StringBuffer sql = new StringBuffer(); 
		sql.append(" select count(*) from guestbook ");
		sql.append(" where no = ? ");
		sql.append(" and passwd= ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt>0)flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return  flag;
	}
	
	public void upAnsnum(Map map) {
		Connection con =DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update bbs set ");
		sql.append(" ansnum = ansnum + 1 ");
		sql.append(" where grpno=?  ");
		sql.append(" and ansnum> ? ");
		
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		
		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
	}
}
