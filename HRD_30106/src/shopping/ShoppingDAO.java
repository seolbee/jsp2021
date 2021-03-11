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
		return custno+1;
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
		String sql = "SELECT custno, custname, phone, address, to_char(joindate, 'YYYY\"년\" MONTH DD\"일\"') as joindate, case grade when 'A' then 'VIP' when 'B' then '일반' when 'C' then '직원' end as grade, case city when '01' then '서울' when '10' then '인천' when '20' then'성남' when '30' then '대전' when '40' then '광주' when '60' then '부산' end as city FROM member_tbl_02 ORDER BY custno";
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setJoindate(rs.getString("joindate"));
				dto.setGrade(rs.getString("grade"));
				dto.setCity(rs.getString("city"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs);
			DBConnection.close(pstmt);
			DBConnection.close(con);
		}
		return list;
	}
	
	public ArrayList<MoneyVO> getMoneyList(){
		ArrayList<MoneyVO> list = new ArrayList<MoneyVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT member.custno as custno, custname, case grade when 'A' then 'VIP' when 'B' then '일반' when 'C' then 'C' end as grade, price FROM member_tbl_02 member, (SELECT custno, SUM(price) as price FROM money_tbl_02 GROUP BY custno) money WHERE money.custno = member.custno ORDER BY price desc";
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MoneyVO vo = new MoneyVO(rs.getInt("custno"), rs.getString("custname"), rs.getString("grade"), rs.getInt("price"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs);
			DBConnection.close(pstmt);
			DBConnection.close(con);
		}
		return list;
	}
	
	public MemberDTO getMember(int custno) {
		MemberDTO dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT custno, custname, phone, address, to_char(joindate, 'YYYY\"년\" Month DD \"일\"') as joindate, grade, city FROM member_tbl_02 WHERE custno = ?";
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setJoindate(rs.getString("joindate"));
				dto.setGrade(rs.getString("grade"));
				dto.setCity(rs.getString("city"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs);
			DBConnection.close(pstmt);
			DBConnection.close(con);
		}
		return dto;
	}
	
	public boolean updateMember(MemberDTO dto) {
		boolean result = false;
		String sql = "UPDATE member_tbl_02 SET custname = ?, phone = ?, address = ?, grade = ?, city = ? WHERE custno = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCustname());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getGrade());
			pstmt.setString(5, dto.getCity());
			pstmt.setInt(6, dto.getCustno());
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
}
