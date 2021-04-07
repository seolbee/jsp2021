<%@page import="VO.EmployeeVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="employee.EmployeeDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
	String value = request.getParameter(type);
	System.out.println(type + ", " + value);
	ArrayList<EmployeeVO> list = dao.getEmployeeList(type, value);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<thead>
			<tr>
				<td>사원번호</td>
				<td>사원이름</td>
				<td>급</td>
				<td>부서이름</td>
				<td>전화번호</td>
				<td>직급</td>
				<td>비고</td>
			</tr>
		</thead>
		<tbody>
			<% for(EmployeeVO vo:list) { %>
				<tr>
					<td><%=vo.getEmpno() %></td>
					<td><%=vo.getEmpname() %></td>
					<td><%=vo.getPosition() %>급</td>
					<td><%=vo.getDept() %></td>
					<td><%=vo.getPhone() %></td>
					<td><%=vo.getDuty() %></td>
					<td><a href="updateEmployee.jsp?empno=<%=vo.getEmpno() %>">수정</a></td>
				</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>