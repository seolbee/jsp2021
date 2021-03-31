<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="course.CourseDAO"/>
	<table border="1">
		<thead>
			<tr>
				<td>과목코드</td>
				<td>과목명</td>
				<td>학점</td>
				<td>담당강사</td>
				<td>요일</td>
				<td>시작시간</td>
				<td>종료시간</td>
				<td>관리</td>
			</tr>
		</thead>
		<tbody>
			<% for(CourseVO vo : dao.getCourseList()) { %>
				<tr>
					<td><%= vo.getId() %></td>
					<td><%= vo.getName() %></td>
					<td><%= vo.getCredit() %></td>
					<td><%= vo.getLecturer() %></td>
					<td><%= vo.getWeek() %></td>
					<td><%= dao.format(vo.getStart_hour()) %></td>
					<td><%= vo.getEnd_end() %></td>
					<td>
						<a href="updateCourse.jsp?id=<%=vo.getId()%>">수정</a> / <a href="deleteCourse.jsp?id=<%=vo.getId()%>">삭제</a>
					</td>
				</tr>
			<% } %>
		</tbody>
	</table>
	<a href="insertCourse.jsp">작성</a>
	<a href="insertLecturer.jsp">강사 추가</a>
	<a href="deleteLecturer.jsp">강사 삭제</a>
<%@ include file="footer.jsp"%>