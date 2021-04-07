package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBUtil {
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
		return con;
	}
	
	public static void close(ResultSet rs) {
		try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
	}
	
	public static void close(PreparedStatement pstmt) {
		try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
	}
	
	public static void close(Connection con) {
		try {if(con != null) con.close();} catch (Exception e) {e.printStackTrace();}
	}
	
	public static void close(Statement stmt) {
		try {if(stmt != null) stmt.close();} catch (Exception e) {e.printStackTrace();}
	}
}
