package employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.EmployeeVO;

public class EmployeeDAO {
	public ArrayList<EmployeeVO> getEmployeeList(String type, String value){
		ArrayList<EmployeeVO> list = new ArrayList<>();
		String sql = "SELECT * FROM personnel WHERE "+type+" = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = Util.DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, value);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				EmployeeVO vo = new EmployeeVO();
				vo.setEmpno(rs.getString("empno"));
				vo.setEmpname(rs.getString("empname"));
				vo.setDept(rs.getString("dept"));
				vo.setPosition(rs.getString("position"));
				vo.setDuty(rs.getString("duty"));
				vo.setPhone(rs.getString("phone"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.DBUtil.close(rs);
			Util.DBUtil.close(pstmt);
			Util.DBUtil.close(con);
		}
		return list;
	}
	
	public boolean insert(EmployeeVO vo) {
		boolean insert = false;
		String sql = "INSERT INTO personnel VALUES(?, ?, ?, ?, ?, ?)";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Util.DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getEmpno());
			pstmt.setString(2, vo.getEmpname());
			pstmt.setString(3, vo.getDept());
			pstmt.setString(4, vo.getPosition());
			pstmt.setString(5, vo.getDuty());
			pstmt.setString(6, vo.getPhone());
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) insert = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.DBUtil.close(pstmt);
			Util.DBUtil.close(con);
		}
		return insert;
	}
	
	public boolean update(EmployeeVO vo) {
		boolean update = false;
		String sql = "UPDATE personnel SET empname = ?, dept = ?, position = ?, duty = ?, phone = ? WHERE empno = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Util.DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getEmpname());
			pstmt.setString(2, vo.getDept());
			pstmt.setString(3, vo.getPosition());
			pstmt.setString(4, vo.getDuty());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getEmpno());
			int cnt = pstmt.executeUpdate();
			update = cnt > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.DBUtil.close(pstmt);
			Util.DBUtil.close(con);
		}
		return update;
	}
	
	public boolean delete(String empno) {
		boolean delete = false;
		String sql = "DELETE FROM personnel WHERE empno = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Util.DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, empno);
			int cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.DBUtil.close(pstmt);
			Util.DBUtil.close(con);
		}
		return delete;
	}
	
	public EmployeeVO getEmployee(String empno) {
		EmployeeVO vo = null;
		String sql = "SELECT * FROM personnel WHERE empno = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Util.DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, empno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new EmployeeVO();
				vo.setEmpno(rs.getString("empno"));
				vo.setEmpname(rs.getString("empname"));
				vo.setDept(rs.getString("dept"));
				vo.setPosition(rs.getString("position"));
				vo.setDuty(rs.getString("duty"));
				vo.setPhone(rs.getString("phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.DBUtil.close(rs);
			Util.DBUtil.close(pstmt);
			Util.DBUtil.close(con);
		}
		return vo;
	}
}
