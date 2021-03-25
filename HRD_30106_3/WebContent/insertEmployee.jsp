<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="employee.EmployeeDAO"/>
<h1>사원 등록</h1>
<form action="insertEmployeePro.jsp" method="post">
	<div class="input_box">
		<label>사원번호</label>
		<input type="text" name="empno" value="<%=dao.getMaxNo()%>" required readonly/>
	</div>
	<div class="input_box">
		<label>사원이름</label>
		<input type="text" name="empname" required/>
	</div>
	<div class="input_box">
		<label>입사일자</label>
		<input type="text" name="joindate" required/>
	</div>
	<div class="input_box">
		<select name="rank" required>
			<option value="A">사원</option>
			<option value="B">대리</option>
			<option value="C">과장</option>
		</select>
	</div>
	<div class="input_box">
		<select name="dept" required>
			<option value="A">디자인</option>
			<option value="B">백엔드</option>
			<option value="C">프론트</option>
		</select>
	</div>
	<button>등록</button>
</form>
<%@ include file="footer.jsp" %>