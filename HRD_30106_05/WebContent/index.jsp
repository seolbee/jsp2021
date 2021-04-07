<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1>인사관리시스템</h1>
	</header>
	<fieldset>
		<legend>인사관리 메인메뉴</legend>
		<button onclick="location.href='selectEmployee.jsp'">조회</button>
		<button onclick="location.href='insertEmployee.jsp'">사원등록</button>
		<button onclick="location.href='updateEmployee.jsp'">정보변경</button>
		<button onclick="location.href='deleteEmployee.jsp'">퇴사처리</button>
		<button onclick="window.close()">종료</button>
	</fieldset>
</body>
</html>