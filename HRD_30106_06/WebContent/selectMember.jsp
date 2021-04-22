<%@page import="VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="injection.InjectionDAO"/>
<%@ include file="header.jsp" %>
<table border=1>
	<thead>
		<tr>
			<td>회원코드</td>
			<td>회원이름</td>
			<td>생년월일</td>
			<td>전화번호</td>
			<td>성별</td>
			<td>도시코드</td>
		</tr>
	</thead>
	<tbody>
		<% for(MemberVO vo : dao.getMemberList()) { %>
			<tr>
				<td><%= vo.getP_no() %></td>
				<td><%= vo.getP_name() %></td>
				<td><%= vo.getP_birth() %></td>
				<td><%= vo.getP_phone() %></td>
				<td><%= vo.getP_gender() %></td>
				<td><%= vo.getP_city() %></td>
			</tr>
		<% } %>
	</tbody>
</table>
<%@ include file="footer.jsp" %>