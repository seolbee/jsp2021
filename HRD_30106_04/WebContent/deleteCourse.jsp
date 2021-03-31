<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="course.CourseDAO"/>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	boolean delete = dao.delete(id);
	if(delete){
%>
<script>
	alert("강사 삭제 완료");
	location.href="index.jsp";
</script>
<% } %>