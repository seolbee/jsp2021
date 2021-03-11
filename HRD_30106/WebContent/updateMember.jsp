<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="shopping.ShoppingDAO"/>
<jsp:useBean id="dto" class="shopping.MemberDTO"/>
<%	
	request.setCharacterEncoding("UTF-8");
	int custno = Integer.parseInt(request.getParameter("custno"));
	dto = dao.getMember(custno);
	String msg = null;
	if(session.getAttribute("msg") != null){
		msg = (String)session.getAttribute("msg");
		session.removeAttribute("msg");
%>
<script>
	alert("<%= msg %>");
</script>
<%
	}
%>
	<h1 style="text-align:center">홈쇼핑 회원 정보 수정</h1>
	 <form method="post" action="updateMemberPro.jsp">
	 	<table style="margin: 0 auto" border=1>
	 		<tr>
	 			<td>회원번호(자동발생)</td>
	 			<td><input type="number" value="<%= dto.getCustno() %>" name="custno" required readonly></td>
	 		</tr>
	 		<tr>
	 			<td>회원성명</td>
	 			<td><input type="text" name="custname" value="<%= dto.getCustname() %>" required></td>
	 		</tr>
	 		<tr>
	 			<td>회원전화</td>
	 			<td><input type="text" name="phone" value="<%= dto.getPhone() %>" required></td>
	 		</tr>
	 		<tr>
	 			<td>통신사[SK, KT, LG]</td>
	 			<td>
	 				<input type="radio" name="address" value="SK" <%= dto.getAddress().equals("SK") ? "checked" : "" %> required> SK
	 				<input type="radio" name="address" value="KT" <%= dto.getAddress().equals("KT") ? "checked" : "" %> required> KT
	 				<input type="radio" name="address" value="LG" <%= dto.getAddress().equals("LG") ? "checked" : "" %> required> LG
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>가입일자</td>
	 			<td><input type="text" name="joindate" value="<%= dto.getJoindate() %>" readonly required></td>
	 		</tr>
	 		<tr>
	 			<td>고객등급[A:VIP, B:일반, C:직원]</td>
	 			<td>
	 				<select name="grade">
	 					<option value="A" <%= dto.getGrade().equals("A") ? "selected" : "" %>>A</option>
	 					<option value="B" <%= dto.getGrade().equals("B") ? "selected" : "" %>>B</option>
	 					<option value="C" <%= dto.getGrade().equals("C") ? "selected" : "" %>>C</option>
	 				</select>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>도시코드</td>
	 			<td><input type="text" name="city" value="<%= dto.getCity()%>"></td>
	 		</tr>
	 		<tr>
	 			<td colspan=2 style="text-align:center">
					<button>수정</button>
	 				<button type="button" onclick="location.href='selectMember.jsp'">조회</button>
	 			</td>
	 		</tr>
	 	</table>
	 </form>
</body>
</html>