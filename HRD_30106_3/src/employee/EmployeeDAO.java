package employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import VO.SalaryVO;
import dto.EmployeeDTO;

public class EmployeeDAO {
	public int getMaxNo() {
		int empno = 0;
		String sql = "SELECT MAX(empno) as empno FROM employee_tbl";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = Util.DBUtil.getConn();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) empno = rs.getInt("empno");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.DBUtil.close(rs);
			Util.DBUtil.close(stmt);
			Util.DBUtil.close(con);
		}
		return ++empno;
	}
	
	public boolean insertEmployee(EmployeeDTO dto) {
		boolean insert = false;
		String sql = "INSERT INTO employee_tbl VALUES(?, ?, TO_DATE(?), ?, ?)";
		Connection con =  null;
		PreparedStatement pstmt = null;
		try {
			con = Util.DBUtil.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getEmpno());
			pstmt.setString(2, dto.getEmpname());
			pstmt.setString(3, dto.getJoindate());
			pstmt.setString(4, dto.getRank());
			pstmt.setString(5, dto.getDept());
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
	
	public ArrayList<EmployeeDTO> getEmployeeList(){
		ArrayList<EmployeeDTO> list = new ArrayList<EmployeeDTO>();
		String sql = "SELECT empno, empname, TO_CHAR(joindate, 'YYYY-MM-DD') as joindate, case rank when 'A' then '사원' when 'B' then '대리' when 'C' then '과장' end as rank, case dept when 'A' then '디자인' when 'B' then '백엔드' when 'C' then '프론트' end as dept FROM employee_tbl ORDER BY empno";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = Util.DBUtil.getConn();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				EmployeeDTO dto = new EmployeeDTO();
				dto.setEmpno(rs.getInt("empno"));
				dto.setEmpname(rs.getString("empname"));
				dto.setJoindate(rs.getString("joindate"));
				dto.setRank(rs.getString("rank"));
				dto.setDept(rs.getString("dept"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.DBUtil.close(rs);
			Util.DBUtil.close(stmt);
			Util.DBUtil.close(con);
		}
		return list;
	}
	
	public EmployeeDTO getEmployee(int empno) {
		EmployeeDTO dto = null;
		String sql = "SELECT empno, empname, TO_CHAR(joindate, 'YYYY-MM-DD') as joindate, rank, dept FROM employee_tbl WHERE empno = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Util.DBUtil.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new EmployeeDTO();
				dto.setEmpno(rs.getInt("empno"));
				dto.setEmpname(rs.getString("empname"));
				dto.setJoindate(rs.getString("joindate"));
				dto.setRank(rs.getString("rank"));
				dto.setDept(rs.getString("dept"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.DBUtil.close(rs);
			Util.DBUtil.close(pstmt);
			Util.DBUtil.close(con);
		}
		return dto;
	}
	
	public boolean updateEmployee(EmployeeDTO dto) {
		boolean update = false;
		String sql = "UPDATE employee_tbl SET empname = ?, joindate = TO_DATE(?), rank = ?, dept = ? WHERE empno = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Util.DBUtil.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getEmpname());
			pstmt.setString(2, dto.getJoindate());
			pstmt.setString(3, dto.getRank());
			pstmt.setString(4, dto.getDept());
			pstmt.setInt(5, dto.getEmpno());
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) update = true;	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.DBUtil.close(pstmt);
			Util.DBUtil.close(con);
		}
		return update;
	}
	
	public ArrayList<SalaryVO> getSalaryList(){
		ArrayList<SalaryVO> list = new ArrayList<>();
		String sql = "SELECT empname, NVL(salary, 0) as salary, emp.empno FROM employee_tbl emp LEFT JOIN (SELECT sum(pay) as salary, empno FROM salary_tbl GROUP BY empno) pay ON emp.empno = pay.empno ORDER BY salary DESC";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = Util.DBUtil.getConn();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				SalaryVO vo = new SalaryVO();
				vo.setEmpno(rs.getInt("empno"));
				vo.setEmpname(rs.getString("empname"));
				vo.setSalary(rs.getInt("salary"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.DBUtil.close(rs);
			Util.DBUtil.close(stmt);
			Util.DBUtil.close(con);
		}
		return list;
	}
}
