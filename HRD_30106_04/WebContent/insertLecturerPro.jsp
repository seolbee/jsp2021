<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="course.CourseDAO"/>
<jsp:useBean id="dto" class="course.LecturerDTO"/>
<jsp:setProperty name="dto" property="*"/>

<%
	boolean insert = dao.insert(dto);
	if(insert){
%>
<script>
	alert("강사 추가 완료");
	location.href="index.jsp";
</script>
<% } %>