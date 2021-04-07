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
		<legend>인사관리 조회</legend>
		<form action="selectListEmployee.jsp" method="post">
			<input type="radio" name="type" value="empno"> 사원번호로 조회
			<input type="text" name="empno">
			<br><br>
			<input type="radio" name="type" value="dept"> 부서명으로 조회
			<select name="dept">
				<option value="인사부">인사부</option>
				<option value="기획부">기획부</option>
				<option value="홍보부">홍보부</option>
				<option value="영업부">영업부</option>
				<option value="경리부">경리부</option>
			</select>
			<br><br>
			<button>조회</button>
			<button type="button" onclick="location.href='index.jsp'">취소</button>
		</form>
	</fieldset>
</body>
</html>