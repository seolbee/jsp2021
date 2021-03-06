package injection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Util.DBUtil;
import VO.MemberVO;

public class InjectionDAO {
	public ArrayList<MemberVO> getMemberList(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = "SELECT p_no, p_name, SUBSTR(p_birth, 0, 4) || '년' || SUBSTR(p_birth, 5, 2) || '월' || SUBSTR(p_birth, 7, 2) || '일' as p_birth, p_tel1 || '-' || p_tel2 || '-' || p_tel3 as p_phone, CASE p_gender WHEN 'M' THEN '남' WHEN 'F' THEN '여' END AS p_gender, CASE p_city WHEN '10' THEN '서울' WHEN '20' THEN '경기' WHEN '30' THEN '부산' WHEN '40' THEN '대구' END AS p_city FROM tbl_cust_20104";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				MemberVO vo = new MemberVO(rs.getString("p_no"), rs.getString("p_name"), rs.getString("p_birth"), rs.getString("p_phone"), rs.getString("p_gender"), rs.getString("p_city"));
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
}
