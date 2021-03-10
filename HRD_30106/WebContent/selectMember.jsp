<%@page import="shopping.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="shopping.ShoppingDAO"/>
	<%
		ArrayList<MemberDTO> list = dao.getMemberList();
	%>
	<center>
		<h1>회원목록조회/수정</h1>
		<table>
			<thead>
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>전화번호</td>
					<td>통신사</td>
					<td>가입일자</td>
					<td>고객등급</td>
					<td>거주지역</td>
				</tr>
			</thead>
			<tbody>
				<%
					for(MemberDTO dto:list){
						
				%>
				<tr>
					<td><%=dto.getCustno() %></td>
					<td><%=dto.getCustname() %></td>
					<td><%=dto.getPhone() %></td>
					<td><%=dto.getAddress() %></td>
					<td><%=dto.getJoindate() %></td>
					<td><%=dto.getGrade() %></td>
					<td><%=dto.getCity()%></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</center>
</body>
</html>