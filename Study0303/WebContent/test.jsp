<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "hr";
		String password = "hr";
		Connection con = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e){
			e.printStackTrace();
		}
		
		String sql = "DROP table test";
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
		
		con = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e){
			e.printStackTrace();
		}
		
		sql = "create table test(id	varchar2(5), pwd	varchar2(5))";
		pstmt = null;
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
		con = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e){
			e.printStackTrace();
		}
		sql = "INSERT INTO test VALUES ('aa', '11')";
		pstmt = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
		
		con = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e){
			e.printStackTrace();
		}
		sql = "INSERT INTO test VALUES ('bb', '22')";
		pstmt = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>