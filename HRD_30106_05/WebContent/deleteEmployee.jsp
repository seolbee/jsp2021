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
		<h1>인사관리 퇴사처리 화면</h1>
	</header>
	<hr>
	<fieldset>
		<legend>인사관리 사원정보 변경</legend>
		<form action="deleteEmployeePro.jsp" method="post">
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
					<td>
						<button>삭제</button>
						<button type="button" onclick="location.href='index.jsp'">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</fieldset>
</body>
</html>