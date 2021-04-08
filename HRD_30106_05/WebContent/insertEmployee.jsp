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
		<h1>인사관리 사원등록화면</h1>
	</header>
	<hr>
	<fieldset>
		<legend>사원 등록</legend>
		<form action="insertEmployeePro.jsp" method="post">
			<table>
				<tr>
					<td>사원번호</td>
					<td><input type="text" name="empno"/></td>
				</tr>
				<tr>
					<td>사원이름</td>
					<td><input type="text" name="empname"/></td>
				</tr>
				<tr>
					<td>부서</td>
					<td>
						<select name="dept">
							<option value="인사부">인사부</option>
							<option value="기획부">기획부</option>
							<option value="홍보부">홍보부</option>
							<option value="영업부">영업부</option>
							<option value="경리부">경리부</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>직 급</td>
					<td>
						<select name="position">
							<option value="1">1급</option>
							<option value="2">2급</option>
							<option value="3">3급</option>
							<option value="4">4급</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>직 책</td>
					<td><input type="text" name="duty"/></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone"/></td>
				</tr>
				<tr>
					<td>
						<button>등록</button>
						<button type="button" onclick="location.href='index.jsp'">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</fieldset>
</body>
</html>