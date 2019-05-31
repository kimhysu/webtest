package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sun.org.apache.bcel.internal.generic.DASTORE;

import db.DBClose;
import db.DBOpen;

public class MemberDAO {
	
	public String findId(Map map) {
		String id = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("     select id from member   ");
		sql.append("      where mname = ?  ");
		sql.append("      and email= ?  ");
		String mname = (String)map.get("mname");
		String email = (String)map.get("email");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mname);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString("id");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		return id;
	}
	
	public String findPw(Map map) {
		String passwd = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("     select passwd from member   ");
		sql.append("      where id = ?  ");
		sql.append("      and email= ?  ");
		String id = (String)map.get("id");
		String email = (String)map.get("email");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				passwd = rs.getString("passwd");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		return passwd;
	}
	
	public boolean loginCheck(Map map) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from member ");
		sql.append(" where id = ? ");
		sql.append(" and passwd = ? ");

		String id = (String)map.get("id");
		String pw = (String)map.get("pw");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt>0) flag = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}
	
	public String getGrade(String id) {
		String grade = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select grade from member ");
		sql.append(" where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				grade = rs.getString("grade");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return grade;
	}
	public boolean updatePw(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		String id = (String)map.get("id");
		String pw = (String)map.get("pw");
		
		sql.append(" update member ");
		sql.append(" set passwd=? ");
		sql.append(" where id=? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
	public boolean updateFile(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		String id = (String)map.get("id");
		String fname = (String)map.get("fname");
		
		sql.append(" update member ");
		sql.append(" set fname=? ");
		sql.append(" where id=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)
				flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
		public int total(Map map) {
			int total = 0;
			Connection con = DBOpen.open();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuffer sql = new StringBuffer();
			
        	String col = (String)map.get("col");
        	String word = (String)map.get("word");
        	
			sql.append(" select count(*) from member  ");
			
			if(word.trim().length()>0)
				sql.append(" where "+ col +" like '%'||?||'%' ");
			
			try {
				pstmt = con.prepareStatement(sql.toString());
			
				if(word.trim().length()>0) {
					pstmt.setString(1, word);
				}
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					total = rs.getInt(1);
				}
			
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBClose.close(rs, pstmt, con);
			}
			return total;
		}
		public boolean duplicateId(String id) {
			boolean flag = false;
			Connection con = DBOpen.open();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			StringBuffer sql = new StringBuffer();
			sql.append(" select count(id) ");
			sql.append(" from member ");
			sql.append(" where id = ? ");  //중복검사 쿼리문
			
			try {
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					int cnt = rs.getInt(1); //cound(id)
					
					if(cnt>0) flag=true;   
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				DBClose.close(rs, pstmt, con);
			}
			
			return flag;
		}
		
		public boolean duplicateEmail(String email) {
			boolean flag = false;
			Connection con = DBOpen.open();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			StringBuffer sql = new StringBuffer();
			sql.append(" select count(email) ");
			sql.append(" from member ");
			sql.append(" where email = ? ");  //중복검사 쿼리문
			
			try {
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, email);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					int cnt = rs.getInt(1); //cound(email)
					
					if(cnt>0) flag=true;   
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				DBClose.close(rs, pstmt, con);
			}
			
			return flag;
		}

        public boolean create(MemberDTO dto) {
        	boolean flag = false;
			Connection con = DBOpen.open();
			PreparedStatement pstmt = null;
			
			
			StringBuffer sql = new StringBuffer();
			sql.append(" insert into member(id,passwd,mname,tel,email,zipcode, ");
			sql.append(" address1,address2,job,mdate,fname,grade) ");
			sql.append(" values(?,?,?,?,?,?,?,?,?,sysdate,?,'H') ");
			
			try {
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPasswd());
				pstmt.setString(3, dto.getMname());
				pstmt.setString(4, dto.getTel());
				pstmt.setString(5, dto.getEmail());
				pstmt.setString(6, dto.getZipcode());
				pstmt.setString(7, dto.getAddress1());
				pstmt.setString(8, dto.getAddress2());
				pstmt.setString(9, dto.getJob());
				pstmt.setString(10, dto.getFname());
				
				int cnt = pstmt.executeUpdate();
				
				if(cnt>0)
					flag = true;
				} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				DBClose.close(pstmt, con);
			}
			
			return flag;
        }
        public MemberDTO read(String id) {
        	MemberDTO dto = null;
        	Connection con = DBOpen.open();
        	PreparedStatement pstmt = null;
        	ResultSet rs = null;
        	
        	StringBuffer sql = new StringBuffer();
        	sql.append(" select id, mname, tel, email, zipcode, address1, address2, job, mdate, fname ");
        	sql.append(" from member ");
        	sql.append(" where id = ? ");
        	
        	try {
        		pstmt = con.prepareStatement(sql.toString());
        		pstmt.setString(1, id);
        		
        		rs = pstmt.executeQuery();
        		
        		if(rs.next()) {
        			dto = new MemberDTO();
        			dto.setId(rs.getString("id"));
        			dto.setMname(rs.getString("mname"));
        			dto.setTel(rs.getString("tel"));
        			dto.setEmail(rs.getString("email"));
        			dto.setAddress1(rs.getString("address1"));
        			dto.setAddress2(rs.getString("address2"));
        			dto.setJob(rs.getString("job"));
        			dto.setMdate(rs.getString("mdate"));
        			dto.setFname(rs.getString("fname"));
        		}
        	} catch (SQLException e) {
        		
        		e.printStackTrace();
        	}finally {
        		DBClose.close(rs,pstmt, con);
        	}
        	
        	return dto;
        }
        public boolean update(MemberDTO dto) {
        	boolean flag = false;
        	Connection con = DBOpen.open();
        	PreparedStatement pstmt = null;
        	
        	
        	StringBuffer sql = new StringBuffer();
        	sql.append(" UPDATE member    ");
        	sql.append(" SET  ");
        	sql.append(" tel=  ?,   ");
        	sql.append(" email=  ?,  ");
        	sql.append(" zipcode=  ?,    ");
        	sql.append("     address1=  ?,   ");
        	sql.append("     address2=  ?,   ");
        	sql.append("     job=  ? ");
        	sql.append(" WHERE id = ?   ");
        	
        	try {
        		pstmt = con.prepareStatement(sql.toString());
        		pstmt.setString(1, dto.getTel());
        		pstmt.setString(2, dto.getEmail());
        		pstmt.setString(3, dto.getZipcode());
        		pstmt.setString(4, dto.getAddress1());
        		pstmt.setString(5, dto.getAddress2());
        		pstmt.setString(6, dto.getJob());
        		pstmt.setString(7, dto.getId());
    
        		
        		int cnt = pstmt.executeUpdate();
        		if(cnt>0) {
        			flag=true;
        		}
        	} catch (SQLException e) {
        		
        		e.printStackTrace();
        	}finally {
        		DBClose.close(pstmt, con);
        	}
        	
        	return flag;
        }
        public boolean delete(String id) {
        	boolean flag = false;
        	Connection con = DBOpen.open();
        	PreparedStatement pstmt = null;
        	
        	
        	StringBuffer sql = new StringBuffer();
        	sql.append(" delete from member ");
        	sql.append(" where id = ? ");

        	try {
        		pstmt = con.prepareStatement(sql.toString());
        		pstmt.setString(1, id);
        		
        		int cnt= pstmt.executeUpdate();
        		if(cnt>0) {
        			flag=true;
        		}
        	} catch (SQLException e) {
        		
        		e.printStackTrace();
        	}finally {
        		DBClose.close(pstmt, con);
        	}
        	
        	return flag;
        }
        public List<MemberDTO> list(Map map) {
        	List<MemberDTO> list = new ArrayList<MemberDTO>();
        	Connection con = DBOpen.open();
        	PreparedStatement pstmt = null;
        	ResultSet rs = null;
        	
        	String col = (String)map.get("col");
        	String word = (String)map.get("word");
        	int sno = (Integer)map.get("sno");
        	int eno = (Integer)map.get("eno");
        	
        	StringBuffer sql = new StringBuffer();
        	sql.append(" SELECT id, mname, tel, email, zipcode, address1, address2, ");
        	sql.append(" fname,  r ");
        	sql.append(" from(");
        	sql.append(" SELECT id, mname, tel, email, zipcode, address1, address2, ");
        	sql.append(" fname, rownum r ");
        	sql.append(" from( ");
        	sql.append(" SELECT id, mname, tel, email, zipcode, address1, ");
        	sql.append(" address2, fname ");
        	sql.append(" FROM member ");
        	
        	if(word.trim().length()>0)
        		sql.append(" where "+ col +" like '%'||?||'%' ");
        	
        	sql.append(" ORDER BY mdate DESC ");
        	sql.append(" ) ");
        	sql.append(" )where r >= ? and r <= ? ");
        	
        	try {
        		int i =0; 
        		pstmt = con.prepareStatement(sql.toString());
        		
        		if(word.trim().length()>0) {
        			pstmt.setString(++i, word);
    	
        		}
        		pstmt.setInt(++i, sno);
        		pstmt.setInt(++i, eno);
        		
        		rs = pstmt.executeQuery();
        		
        		while(rs.next()) {
        			MemberDTO dto = new MemberDTO();
        			dto.setId(rs.getString("id"));
        			dto.setMname(rs.getString("mname"));
        			dto.setEmail(rs.getString("email"));
        			dto.setFname(rs.getString("fname"));
        			dto.setTel(rs.getString("tel"));
        			dto.setAddress1(rs.getString("address1"));
        			dto.setAddress2(rs.getString("address2"));
        			dto.setZipcode(rs.getString("zipcode"));
        			
        			list.add(dto);
        		}
        	} catch (SQLException e) {
        		
        		e.printStackTrace();
        	}finally {
        		DBClose.close(rs,pstmt, con);
        	}
        	
        	return list;
        }
}