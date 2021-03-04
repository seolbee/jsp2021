package my.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	private Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
		} catch (ClassNotFoundException e) {
			System.out.println("driver not found");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB connection failed");
			e.printStackTrace();
		}
		return conn;
	}
	
	public List<MemberDTO> selectMembers() {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			conn = getConnection();
			
			String sql = "select * from member";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			list = makeArray(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { if(ps!=null) ps.close();} catch(SQLException e) { }
			try { if(rs!=null) rs.close();} catch(SQLException e) { }
			try { if(conn!=null) conn.close();} catch(SQLException e) { }
		}
		return list;
	}
	
	private List<MemberDTO> makeArray(ResultSet rs) throws SQLException {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setName(rs.getString("name"));
			dto.setId(rs.getString("id"));
			dto.setPass(rs.getString("pass"));
			dto.setBirth(rs.getInt("birth"));
			dto.setGender(rs.getString("gender"));
			dto.setJob(rs.getString("job"));
			dto.setAddress(rs.getString("address"));
			dto.setRegDate(rs.getDate("regDate"));
			list.add(dto);
		}
		return list;
	}
	
	
	public boolean idAvailableChk(String id) {
		boolean result = false;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		try {
			conn = getConnection();
			
			String sql = "select * from member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			if(!rs.next()) result = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { if(ps!=null) ps.close();} catch(SQLException e) { }
			try { if(rs!=null) rs.close();} catch(SQLException e) { }
			try { if(conn!=null) conn.close();} catch(SQLException e) { }
		}
		return result;
	}
	
	public boolean insertMember(MemberDTO dto) {
		boolean result = false;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		try {
			conn = getConnection();
			
			String sql = "insert into member values(?,?,?,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPass());
			ps.setInt(4, dto.getBirth());
			ps.setString(5, dto.getGender());
			ps.setString(6, dto.getJob());
			ps.setString(7, dto.getAddress());
			
			int n = ps.executeUpdate();
			if(n>0) result = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { if(ps!=null) ps.close();} catch(SQLException e) { }
			try { if(rs!=null) rs.close();} catch(SQLException e) { }
			try { if(conn!=null) conn.close();} catch(SQLException e) { }
		}
		return result;
		
	}
	
	public int loginCheck(String id, String pass) {
		int result = -1; // -1: not found  0: pwd error  1: success
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			
			String sql = "select pass from member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString("pass");
				if (dbPass.equals(pass)) {
					result = 1;
				} else {
					result = 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { if(ps!=null) ps.close();} catch(SQLException e) { }
			try { if(rs!=null) rs.close();} catch(SQLException e) { }
			try { if(conn!=null) conn.close();} catch(SQLException e) { }
		}
		return result;
	}
	
	public MemberDTO selectMember(String id) {
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT * FROM member WHERE id = ?";
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setBirth(rs.getInt("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setAddress(rs.getString("address"));
				dto.setJob(rs.getString("job"));
				dto.setPass(rs.getString("pass"));
				dto.setRegDate(rs.getDate("regDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { if(pstmt!=null) pstmt.close();} catch(SQLException e) { }
			try { if(rs!=null) rs.close();} catch(SQLException e) { }
			try { if(con!=null) con.close();} catch(SQLException e) { }
		}
		return dto;
	}
	
	public boolean updateMember(MemberDTO dto) {
		boolean update = false;
		String sql = "UPDATE member SET pass = ?, birth = ?, gender = ?, job = ?, address = ?, regDate = ? WHERE id = ?";
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(dto.getId());
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPass());
			pstmt.setInt(2, dto.getBirth());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4, dto.getJob());
			pstmt.setString(5, dto.getAddress());
			pstmt.setDate(6, dto.getRegDate());
			pstmt.setString(7, dto.getId());
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) update = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { if(pstmt!=null) pstmt.close();} catch(SQLException e) { }
			try { if(rs!=null) rs.close();} catch(SQLException e) { }
			try { if(con!=null) con.close();} catch(SQLException e) { }
		}
		return update;
	}
	
	public boolean deleteMember(String id, String pass) {
		
		boolean delete = false;
		String sql = "DELETE FROM member WHERE id = ? AND pass = ?";
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) delete = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { if(pstmt!=null) pstmt.close();} catch(SQLException e) { }
			try { if(rs!=null) rs.close();} catch(SQLException e) { }
			try { if(con!=null) con.close();} catch(SQLException e) { }
		}
		return delete;
	}
	
	
}
