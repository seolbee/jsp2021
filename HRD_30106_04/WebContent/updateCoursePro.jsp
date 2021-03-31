<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="course.CourseDAO"/>
<jsp:useBean id="dto" class="course.CourseDTO"/>
<jsp:setProperty name="dto" property="*"/>

<%

	boolean update = dao.update(dto);
	if(update){
%>
<script>
	alert("교과목 수정 완료");
	location.href="index.jsp";
</script>
<% } %>