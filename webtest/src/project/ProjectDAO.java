package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class ProjectDAO {
	public boolean passCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(imgno) as cnt ");
		sql.append(" from project ");
		sql.append(" where imgno=?  and passwd= ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, (Integer) map.get("imgno"));
			pstmt.setString(2, (String) map.get("passwd"));

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int cnt = rs.getInt("cnt");
				if (cnt > 0)
					flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	public boolean create(ProjectDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" insert into project(imgno,  title, passwd, mname, content, wdate,fname)  ");
		sql.append(" values((SELECT NVL(MAX(imgno), 0) + 1 as imgno FROM project), ");
		sql.append(" ?, ?, ?, ?, sysdate, ?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getFname());
			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
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

	public void upViewcnt(int imgno) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" update project ");
		sql.append(" set viewcnt = viewcnt +1 ");
		sql.append(" where imgno= ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public boolean delete(int imgno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from project ");
		sql.append(" where imgno= ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		String col = (String) map.get("col");
		String word = (String) map.get("word");

		sql.append(" select count(*) cnt ");
		sql.append(" from project ");

		if (word.trim().length() > 0 && col.equals("title_content")) {
			sql.append(" where title like '%'||?||'%' ");
			sql.append(" or content like '%'||?||'%' ");
		} else if (word.trim().length() > 0) {
			sql.append(" where " + col + " like '%'||?||'%' ");
		}

		try {
			pstmt = con.prepareStatement(sql.toString());

			if (word.trim().length() > 0 && col.equals("title_content")) {
				pstmt.setString(1, word);
				pstmt.setString(2, word);
			} else if (word.trim().length() > 0) {
				pstmt.setString(1, word);
			}
			rs = pstmt.executeQuery();

			if (rs.next()) {
				total = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return total;
	}

	public List<ProjectDTO> list(Map map) {
		List<ProjectDTO> list = new ArrayList<ProjectDTO>();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		String col = (String) map.get("col");
		String word = (String) map.get("word");

		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		sql.append(" select imgno, mname, fname, title, wdate, viewcnt, r  ");
		sql.append(" from(  ");
		sql.append("     select imgno, mname, fname, title, wdate, viewcnt, rownum r  ");
		sql.append("     from(  ");
		sql.append("         select imgno, mname, fname, title, wdate, viewcnt   ");
		sql.append("         from project   ");

		if (word.trim().length() > 0)
			sql.append(" where " + col + " like '%'||?||'%' ");
		else if (word.trim().length() > 0 && col.equals("title_content")) {
			sql.append(" where title like '%'||?||'%' ");
			sql.append(" or content like '%'||?||'%' ");
		}
		sql.append("         order by wdate desc  ");
		sql.append("         )  ");
		sql.append(" )where r>=? and r<=?  ");

		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(++i, word);
			else if (word.trim().length() > 0 && col.equals("title_content")) {
				pstmt.setString(++i, word);
				pstmt.setString(++i, word);
			}

			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProjectDTO dto = new ProjectDTO();
				dto.setImgno(rs.getInt("imgno"));
				dto.setTitle(rs.getString("title"));
				dto.setMname(rs.getString("mname"));
				dto.setWdate(rs.getString("wdate"));
				dto.setFname(rs.getString("fname"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return list;
	}

	public boolean update(ProjectDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update project ");
		sql.append(" set content =?,  ");
		sql.append(" title = ?, ");
		sql.append(" wdate = sysdate ");
		sql.append(" where imgno =? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getTitle());
			pstmt.setInt(3, dto.getImgno());
			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public boolean updatePw(Map map) {
		boolean flag = false;
		String passwd = (String) map.get("passwd");
		int imgno = (Integer) map.get("imgno");
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update project set ");
		sql.append(" passwd =? ");
		sql.append(" where imgno =? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, passwd);
			pstmt.setInt(2, imgno);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	public boolean updateFile(Map map) {
		boolean flag = false;
		String fname = (String) map.get("fname");
		int imgno = (Integer) map.get("imgno");
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update project set ");
		sql.append(" fname =? ");
		sql.append(" where imgno= ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setInt(2, imgno);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	public boolean duplicateId(int imgno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select count(id) cnt");
		sql.append(" from member ");
		sql.append(" where imgno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, imgno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}

	public List imgRead(int imgno) {
		List list = new ArrayList();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM  ");
		sql.append("   (  ");
		sql.append("      select    ");
		sql.append("          lag(imgno,2)     over (order by imgno) pre_imgno2,    ");
		sql.append("          lag(imgno,1)     over (order by imgno ) pre_imgno1,   ");
		sql.append("          imgno,  ");
		sql.append("          lead(imgno,1)    over (order by imgno) nex_imgno1,    ");
		sql.append("          lead(imgno,2)    over (order by imgno) nex_imgno2,    ");
		sql.append("          lag(fname,2)  over (order by imgno) pre_file2,     ");
		sql.append("          lag(fname,1)  over (order by imgno ) pre_file1,  ");
		sql.append("          fname,   ");
		sql.append("          lead(fname,1) over (order by imgno) nex_file1,  ");
		sql.append("          lead(fname,2) over (order by imgno) nex_file2   ");
		sql.append("          from (  ");
		sql.append("               SELECT imgno, fname   ");
		sql.append("               FROM project ");
		sql.append("               ORDER BY imgno DESC  ");
		sql.append("          )  ");
		sql.append("   )  ");
		sql.append("   WHERE imgno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int[] noArr = { rs.getInt("pre_imgno2"), rs.getInt("pre_imgno1"), rs.getInt("imgno"),
						rs.getInt("nex_imgno1"), rs.getInt("nex_imgno2") };
				String[] files = { rs.getString("pre_file2"), rs.getString("pre_file1"), rs.getString("fname"),
						rs.getString("nex_file1"), rs.getString("nex_file2") };

				list.add(files);
				list.add(noArr);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return list;
	}

	public ProjectDTO read(int imgno) {
		ProjectDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT imgno, title, mname, content, fname, wdate, viewcnt");
		sql.append(" FROM project ");
		sql.append(" WHERE imgno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new ProjectDTO();
				dto.setImgno(rs.getInt("imgno"));
				dto.setTitle(rs.getString("title"));
				dto.setMname(rs.getString("mname"));
				dto.setContent(rs.getString("content"));
				dto.setFname(rs.getString("fname"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return dto;
	}

}
