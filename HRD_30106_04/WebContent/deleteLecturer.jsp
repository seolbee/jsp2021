<%@page import="VO.LecturerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="course.CourseDAO"/>
	<table border="1">
		<thead>
			<tr>
				<td>번호</td>
				<td>강사명</td>
				<td>전공</td>
				<td>세부전공</td>
				<td>기타</td>
			</tr>
		</thead>
		<tbody>
			<% for(LecturerVO vo : dao.getLecturerList()) { %>
				<tr>
					<td><%= vo.getIdx() %></td>
					<td><%= vo.getName() %></td>
					<td><%= vo.getMajor() %></td>
					<td><%= vo.getField() %></td>
					<td>
						<a href="deleteLecturerPro.jsp?idx=<%=vo.getIdx()%>">삭제</a>
					</td>
				</tr>
			<% } %>
		</tbody>
	</table>
<%@ include file="footer.jsp"%>