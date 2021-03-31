<%@page import="dto.EmployeeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="employee.EmployeeDAO"/>
<%@ include file="header.jsp" %>
<h1>회원목록 조회/수정</h1>
<table>
	<thead>
		<tr>
			<td>사원번호</td>
			<td>사원이름</td>
			<td>입사일자</td>
			<td>직급</td>
			<td>부서</td>
			<td>기능</td>
		</tr>
	</thead>
	<tbody>
		<% for(EmployeeDTO dto : dao.getEmployeeList()){ %>
			<tr>
				<td><%= dto.getEmpno() %></td>
				<td><%= dto.getEmpname() %></td>
				<td><%= dto.getJoindate() %></td>
				<td><%= dto.getRank() %> </td>
				<td><%= dto.getDept() %></td>
				<td><a href="updateEmployee.jsp?empno=<%= dto.getEmpno() %>">수정</a></td>
		<%} %>
	</tbody>
</table>
<%@ include file="footer.jsp" %>