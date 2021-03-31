<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="course.CourseDAO"/>

<%
	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	boolean delete = dao.delete(idx);
	if(delete){
%>
<script>
	alert("교과목 삭제 완료");
	location.href="index.jsp";
</script>
<% } %>