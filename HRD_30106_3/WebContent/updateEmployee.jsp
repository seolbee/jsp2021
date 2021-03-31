<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="employee.EmployeeDAO"/>
<jsp:useBean id="dto" class="dto.EmployeeDTO"/>
<%
	request.setCharacterEncoding("UTF-8");
	int empno = Integer.parseInt(request.getParameter("empno"));
	dto = dao.getEmployee(empno);
%>
<h1>사원 등록</h1>
<form action="updateEmployeePro.jsp" method="post">
	<div class="input_box">
		<label>사원번호</label>
		<input type="text" name="empno" value="<%= dto.getEmpno()%>" required readonly/>
	</div>
	<div class="input_box">
		<label>사원이름</label>
		<input type="text" name="empname" required value="<%= dto.getEmpname() %>"/>
	</div>
	<div class="input_box">
		<label>입사일자</label>
		<input type="text" name="joindate" required value="<%= dto.getJoindate() %>"/>
	</div>
	<div class="input_box">
		<select name="rank" required>
			<option value="A" <%= dto.getRank().equals("A") ? "selected" : "" %>>사원</option>
			<option value="B" <%= dto.getRank().equals("B") ? "selected" : "" %>>대리</option>
			<option value="C" <%= dto.getRank().equals("C") ? "selected" : "" %>>과장</option>
		</select>
	</div>
	<div class="input_box">
		<select name="dept" required>
			<option value="A" <%= dto.getDept().equals("A") ? "selected" : "" %>>디자인</option>
			<option value="B" <%= dto.getDept().equals("B") ? "selected" : "" %>>백엔드</option>
			<option value="C" <%= dto.getDept().equals("C") ? "selected" : "" %>>프론트</option>
		</select>
	</div>
	<button>등록</button>
</form>
<%@ include file="footer.jsp" %>