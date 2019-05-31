package team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class TeamDAO {
	
	public int total(Map map) {
		int total =0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*)  ");
		sql.append(" from team  ");
		
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		if(word.trim().length()>0 && col.equals("title_content")) {
			sql.append(" 	where title like '%'||?||'%' ");
			sql.append(" 	or content like '%'||?||'%' ");
		}else if(word.trim().length()>0) {
			sql.append("    where "+ col + " like '%'||?||'%' ");
		}
		try {
			int i =0;
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
	public boolean create(TeamDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into team ");
		sql.append(" (teamno, name, phone, gender, skill, hobby, zipcode, address1, address2) ");
		sql.append(" values( ");
		sql.append(" (select nvl(max(teamno),0)+1 from team), ");
		sql.append(" ?, ?, ?, ?, ?, ?, ?, ?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4, dto.getSkillstr());
			pstmt.setString(5, dto.getHobby());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
	public boolean delete(int teamno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from team where teamno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, teamno);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
	public boolean update(TeamDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update team set phone= ?, ");
		sql.append(" skill= ?, hobby= ?, address1= ?, ");
		sql.append(" address2= ?, zipcode= ? ");
		sql.append(" where teamno= ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPhone());
			pstmt.setString(2, dto.getSkillstr());
			pstmt.setString(3, dto.getHobby());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setInt(7, dto.getTeamno());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
	public List<TeamDTO> list(Map map){
		List<TeamDTO> list = new ArrayList<TeamDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select teamno, name, phone, skill, r");
		sql.append(" from(");
		sql.append(" select teamno, name, phone, skill, rownum r ");
		sql.append(" from( ");
		sql.append(" select teamno, name, phone, skill ");
		sql.append(" from team ");
		
		sql.append(" order by teamno ");
		sql.append("    )  ");
		sql.append("      )where r>=? and r<=?  ");
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
				TeamDTO dto = new TeamDTO();
				dto.setTeamno(rs.getInt("teamno"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setSkillstr(rs.getString("skill"));
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
	
	public TeamDTO read(int teamno) {
		TeamDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select * ");
		sql.append(" from team ");
		sql.append(" where teamno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, teamno);
			rs =pstmt.executeQuery();
	
			if(rs.next()) {
				dto= new TeamDTO();
				dto.setTeamno(rs.getInt("teamno"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setPhone(rs.getString("phone"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setSkillstr(rs.getString("skill"));
				dto.setHobby(rs.getString("hobby"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}
}
