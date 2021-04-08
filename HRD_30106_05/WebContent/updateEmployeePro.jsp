<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="employee.EmployeeDAO"/>
<jsp:useBean id="dto" class="VO.EmployeeVO"/>
<jsp:setProperty name="dto" property="*"/>

<%

	boolean update = dao.update(dto);
	if(update){
%>
<script>
	alert("변경 완료");
	location.href="index.jsp";
</script>

<%
	} else {
%>
<script>
	alert("변경 실패");
	history.back();
</script>
<% } %>