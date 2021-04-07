package employee;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import VO.EmployeeVO;

public class EmployeeDAO {
	public ArrayList<EmployeeVO> getEmployeeList(){
		ArrayList<EmployeeVO> list = new ArrayList<>();
		String sql = "SELECT * FROM personnel";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = Util.DBUtil.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				EmployeeVO vo = new EmployeeVO();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
}
