package shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnection;

public class ShoppingDAO {
	public int getCustNo() {
		int custno = 0;
		String sql = "SELECT MAX(custno) as custno from member_tbl_02";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			custno = rs.getInt("custno");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs);
			DBConnection.close(pstmt);
			DBConnection.close(con);
		}
		return custno;
	}
	
	public boolean insertMember(MemberDTO dto) {
		Connection con = null;
		String sql = "INSERT INTO member_tbl_02 VALUES(?, ?, ?, ?, to_date(?), ?, ?)";
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getCustno());
			pstmt.setString(2, dto.getCustname());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getJoindate());
			pstmt.setString(6, dto.getGrade());
			pstmt.setString(7, dto.getCity());
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(con);
		}
		return result;
	}
	
	public ArrayList<MemberDTO> getMemberList(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT custno, custname, phone, address, to_char(joindate, 'YYYY년 mm월 d일') as joindate, grade, case city when 01 than '서울' when 10 than ''";
		return list;
	}
}
