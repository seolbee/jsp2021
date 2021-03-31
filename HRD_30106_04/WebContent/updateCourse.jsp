<%@page import="VO.LecturerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="course.CourseDAO"/>
<jsp:useBean id="dto" class="course.CourseDTO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	dto = dao.getCourse(id);
%>
<h1>교과목 수정</h1>
<form action="updateCoursePro.jsp" method="post">
<table border=1>
	<tr>
		<td>교과목코드</td>
		<td>
			<input type="text" value="<%= dto.getId() %>" name="id" readonly>
		</td>
	</tr>
	<tr>
		<td>과목명</td>
		<td>
			<input type="text" value="<%= dto.getName() %>" name="name">
		</td>
	</tr>
	<tr>
		<td>담당강사</td>
		<td>
			<select name="lecturer">
			<% for(LecturerVO vo:dao.getLecturerList()){ %>
				<option value="<%= vo.getIdx() %>" <%= vo.getIdx().toString().equals(dto.getLecturer()) ? "selected" : "" %>><%= vo.getName() %></option>
			<% } %>
			</select>
		</td>
	</tr>
	<tr>
		<td>학점</td>
		<td>
			<input type="text" value="<%= dto.getCredit() %>" name="credit">
		</td>
	</tr>
	<tr>
		<td>요일</td>
		<td>
			<input type="radio" value="1" name="week" <%= dto.getWeek() == 1 ? "checked" : "" %>> 월
			<input type="radio" value="2" name="week" <%= dto.getWeek() == 2 ? "checked" : "" %>> 화
			<input type="radio" value="3" name="week" <%= dto.getWeek() == 3 ? "checked" : "" %>> 수
			<input type="radio" value="4" name="week" <%= dto.getWeek() == 4 ? "checked" : "" %>> 목
			<input type="radio" value="5" name="week" <%= dto.getWeek() == 5 ? "checked" : "" %>> 금
			<input type="radio" value="6" name="week" <%= dto.getWeek() == 6 ? "checked" : "" %>> 토
		</td>
	</tr>
	<tr>
		<td>시작</td>
		<td>
			<input type="number" value="<%= dao.format(dto.getStart_hour()) %>" name="start_hour">
		</td>
	</tr>
	<tr>
		<td>종료</td>
		<td>
			<input type="number" value="<%= dao.format(dto.getEnd_end()) %>" name="end_end">
		</td>
	</tr>
</table>
<button onclick="location.href='index.jsp'" type="button">목록</button>
<button>완료</button>
</form>
<%@ include file="footer.jsp" %>