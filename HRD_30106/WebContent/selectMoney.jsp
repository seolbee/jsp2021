<%@page import="java.text.DecimalFormat"%>
<%@page import="shopping.MoneyVO"%>
<%@page import="shopping.MoneyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="shopping.ShoppingDAO"/>
	<%
		ArrayList<MoneyVO> list = dao.getMoneyList();
	%>
	<center>
		<h1>회원매출조회</h1>
		<table border=1 style="text-align:center">
			<thead>
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>고객등급</td>
					<td>매출</td>
				</tr>
			</thead>
			<tbody>
				<%
					for(MoneyVO dto:list){
						
				%>
				<tr>
					<td><%=dto.getCustno() %></td>
					<td><%=dto.getCustname()%></td>
					<td><%=dto.getGrade()%></td>
					<% DecimalFormat df = new DecimalFormat("#,###"); %>
					<td><%=df.format(dto.getPrice())%></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</center>
</body>
</html>