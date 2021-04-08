<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="employee.EmployeeDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	String empno = request.getParameter("empno");
	String empname = request.getParameter("empname");
	boolean delete = dao.delete(empno, empname);
	if(delete){
%>
<script>
	alert("퇴사 처리 됨");
	location.href="index.jsp";
</script>

<%
	} else {
%>
<script>
	alert("오류");
	history.back();
</script>
<% } %>