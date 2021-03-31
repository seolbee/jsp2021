<%@page import="VO.LecturerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="course.CourseDAO"/>
<h1>교과목 추가</h1>
<form action="insertLecturerPro.jsp" method="post">
<table border=1>
	<tr>
		<td>번호</td>
		<td>
			<input type="number" value="<%= dao.getIdx() %>" name="idx">
		</td>
	</tr>
	<tr>
		<td>강사명</td>
		<td>
			<input type="text" value="" name="name">
		</td>
	</tr>
	<tr>
		<td>전공</td>
		<td>
			<input type="text" value="" name="major">
		</td>
	</tr>
	<tr>
		<td>연구분야</td>
		<td>
			<input type="text" value="" name="field">
		</td>
	</tr>
</table>
<button onclick="location.href='index.jsp'" type="button">목록</button>
<button>완료</button>
</form>
<%@ include file="footer.jsp" %>