<%@page import="VO.LecturerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="course.CourseDAO"/>
<h1>교과목 추가</h1>
<form action="insertCoursePro.jsp" method="post">
<table border=1>
	<tr>
		<td>교과목코드</td>
		<td>
			<input type="text" value="" name="id">
		</td>
	</tr>
	<tr>
		<td>과목명</td>
		<td>
			<input type="text" value="" name="name">
		</td>
	</tr>
	<tr>
		<td>담당강사</td>
		<td>
			<select name="lecturer">
			<% for(LecturerVO vo:dao.getLecturerList()){ %>
				<option value="<%= vo.getIdx() %>"><%= vo.getName() %></option>
			<% } %>
			</select>
		</td>
	</tr>
	<tr>
		<td>학점</td>
		<td>
			<input type="text" value="" name="credit">
		</td>
	</tr>
	<tr>
		<td>요일</td>
		<td>
			<input type="radio" value="1" name="week" > 월
			<input type="radio" value="2" name="week" > 화
			<input type="radio" value="3" name="week" > 수
			<input type="radio" value="4" name="week" > 목
			<input type="radio" value="5" name="week" > 금
			<input type="radio" value="6" name="week" > 토
		</td>
	</tr>
	<tr>
		<td>시작</td>
		<td>
			<input type="number" value="" name="start_hour">
		</td>
	</tr>
	<tr>
		<td>종료</td>
		<td>
			<input type="number" name="end_end">
		</td>
	</tr>
</table>
<button onclick="location.href='index.jsp'" type="button">목록</button>
<button>완료</button>
</form>
<%@ include file="footer.jsp" %>