package course;

import java.awt.datatransfer.StringSelection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Util.DBUtil;
import VO.CourseVO;
import VO.LecturerVO;

public class CourseDAO {
	
	public int getIdx() {
		int idx = 0;
		String sql = "SELECT MAX(idx) as idx FROM lecturer_tbl";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) idx = rs.getInt("idx") + 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(stmt);
			DBUtil.close(con);
		}
		
		return idx;
	}
	
	public ArrayList<CourseVO> getCourseList(){
		ArrayList<CourseVO> list = new ArrayList<CourseVO>();
		String sql = "SELECT lec.name as lecturer_name, cour.name, id, credit, CASE week WHEN 1 THEN '월요일' WHEN 2 THEN '화요일' WHEN 3 THEN '수요일' WHEN 4 THEN '목요일' WHEN 5 THEN '금요일' WHEN 6 THEN '토요일' END AS week, start_hour, end_end FROM lecturer_tbl lec, course_tbl cour WHERE lec.idx = cour.lecturer ORDER BY id";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				CourseVO vo = new CourseVO();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setLecturer(rs.getString("lecturer_name"));
				vo.setStart_hour(rs.getInt("start_hour"));
				vo.setEnd_end(rs.getInt("end_end"));
				vo.setCredit(rs.getInt("credit"));
				vo.setWeek(rs.getString("week"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
			DBUtil.close(con);
		}
		return list;
	}
	
	public String format(Integer value) {
		String result = "00" + value.toString();
		return result.substring(result.length()-4, result.length());
	}
	
	public ArrayList<LecturerVO> getLecturerList(){
		ArrayList<LecturerVO> list = new ArrayList<>();
		String sql = "SELECT * FROM lecturer_tbl";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				LecturerVO vo = new LecturerVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setMajor(rs.getString("major"));
				vo.setField(rs.getString("field"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
			DBUtil.close(con);
		}
		return list;
	}
	
	public boolean insert(CourseDTO dto) {
		boolean insert = false;
		String sql = "INSERT INTO course_tbl VALUES(?, ?, ?, ?, ?, ?, ?)";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getCredit());
			pstmt.setString(4, dto.getLecturer());
			pstmt.setInt(5, dto.getWeek());
			pstmt.setInt(6, dto.getStart_hour());
			pstmt.setInt(7, dto.getEnd_end());
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) insert = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(con);
		}
		return insert;
	}
	
	public CourseDTO getCourse(String id) {
		CourseDTO dto = new CourseDTO();
		String sql = "SELECT * FROM course_tbl WHERE id = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setCredit(rs.getInt("credit"));
				dto.setLecturer(rs.getString("lecturer"));
				dto.setWeek(rs.getInt("week"));
				dto.setStart_hour(rs.getInt("start_hour"));
				dto.setEnd_end(rs.getInt("end_end"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(con);
		}
		return dto;
	}
	
	public boolean update(CourseDTO dto) {
		boolean update = false;
		String sql = "UPDATE course_tbl SET name = ?, credit = ?, lecturer = ?, week = ?, start_hour = ?, end_end = ? WHERE id = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getCredit());
			pstmt.setString(3, dto.getLecturer());
			pstmt.setInt(4, dto.getWeek());
			pstmt.setInt(5, dto.getStart_hour());
			pstmt.setInt(6, dto.getEnd_end());
			pstmt.setString(7, dto.getId());
			int cnt = pstmt.executeUpdate();
			update = cnt > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(con);
		}
		return update;
	}
	
	public boolean delete(String id) {
		String sql = "DELETE FROM course_tbl WHERE id = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean delete = false;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			int cnt = pstmt.executeUpdate();
			delete = cnt > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(con);
		}
		return delete;
	}
	
	public boolean insert(LecturerDTO dto){
		boolean insert = false;
		String sql = "INSERT INTO lecturer_tbl VALUES(?, ?, ?, ?)";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getIdx());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getMajor());
			pstmt.setString(4, dto.getField());
			int cnt = pstmt.executeUpdate();
			insert = cnt > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(con);
		}
		return insert;
	}
	
	public boolean delete(int idx) {
		boolean delete =false;
		String sql = "DELETE FROM lecturer_tbl WHERE idx = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			int cnt = pstmt.executeUpdate();
			delete = cnt > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(con);
		}
		return delete;
	}
}
