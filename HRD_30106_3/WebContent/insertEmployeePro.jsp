<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
%>

<jsp:useBean id="dao" class="employee.EmployeeDAO"/>
<jsp:useBean id="dto" class="dto.EmployeeDTO"/>
<jsp:setProperty name="dto" property="*"/>

<% 
	boolean insert = dao.insertEmployee(dto);
	if(insert){
%>
<script>
	alert("등록 완료");
	location.href="selectEmployee.jsp";
</script>

<% } %>