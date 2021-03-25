<%@page import="VO.SalaryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="employee.EmployeeDAO"/>

<h1>사원별 급여 현황</h1>
<table>
	<thead>
		<tr>
			<td>회원번호</td>
			<td>회원이름</td>
			<td>총 급여</td>
		</tr>
	</thead>
	<tbody>
		<% for(SalaryVO vo: dao.getSalaryList()){ %>
		<tr>
			<td><%=vo.getEmpno() %></td>
			<td><%=vo.getEmpname() %></td>
			<td><%=vo.getSalary() %></td>
		</tr>
		<%} %>
	</tbody>
</table>
<%@ include file="footer.jsp" %>