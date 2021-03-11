<%@page import="shopping.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="shopping.ShoppingDAO"/>
<jsp:useBean id="dto" class="shopping.MemberDTO"/>
<%
	if(session.getAttribute("dto") != null) {
		dto = (MemberDTO) session.getAttribute("dto");
	} else {
		dto.setCustno(dao.getCustNo());
		dto.setCustname("");
		dto.setPhone("");
		dto.setAddress("");
		dto.setGrade("");
		dto.setCity("");
	}
%>
	<h1 style="text-align:center">홈쇼핑 회원 등록</h1>
	 <form method="post">
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
	 				<input type="radio" name="address" value="SK" <%= (!dto.getAddress().isEmpty()) && (dto.getAddress().equals("SK")) ? "checked" : "" %> required> SK
	 				<input type="radio" name="address" value="KT" <%= (!dto.getAddress().isEmpty()) && (dto.getAddress().equals("KT")) ? "checked" : "" %> required> KT
	 				<input type="radio" name="address" value="LG" <%= (!dto.getAddress().isEmpty()) && (dto.getAddress().equals("LG")) ? "checked" : "" %> required> LG
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>가입일자</td>
	 			<td><input type="text" name="joindate" value="" id="joindate" required></td>
	 		</tr>
	 		<tr>
	 			<td>고객등급[A:VIP, B:일반, C:직원]</td>
	 			<td>
	 				<select name="grade">
	 					<option value="A" <%= dto.getGrade().isEmpty() && dto.getGrade().equals("A") ? "selected" : "" %>>A</option>
	 					<option value="B" <%= dto.getGrade().isEmpty() && dto.getGrade().equals("B") ? "selected" : "" %>>B</option>
	 					<option value="C" <%= dto.getGrade().isEmpty() && dto.getGrade().equals("C") ? "selected" : "" %>>C</option>
	 				</select>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>도시코드</td>
	 			<td><input type="text" name="city" value="<%= dto.getCity() %>"></td>
	 		</tr>
	 		<tr>
	 			<td colspan=2 style="text-align:center">
					<button type="button" onclick="validating(this.form)">등록</button>
	 				<button type="button" onclick="location.href='selectMember.jsp'">조회</button>
	 			</td>
	 		</tr>
	 	</table>
	 </form>
	 <script>
	 window.onload = function(){now()}
	 	function now(){
	 		let d = new Date();
	 		let year = d.getFullYear();
	 		let month = format(d.getMonth()+1);
	 		let date = format(d.getDate());
	 		document.querySelector("#joindate").value = year + month + date;
	 	}
	 	
	 	function format(v){
	 		let value = "00" + v;
	 		return value.substring(value.length, value.length-2);
	 	}
	 	
	 	function validating(form){
	 		if(form.custname.value.trim() == ""){
	 			alert("회원 성명이 입력되지 않았습니다.");
	 			return false;
	 		}
	 		
	 		if(form.phone.value.trim() == ""){
	 			alert("회원 전화가 입력되지 않았습니다.");
	 			return false;
	 		}
	 		if(form.address.value == ""){
	 			alert("통신사가 입력되지 않았습니다.");
	 			return false;
	 		}
	 		if(form.city.value == ""){
	 			alert("도시 코드가 입력되지 않았습니다.");
	 			return false;
	 		}
	 		alert("회원등록이 완료 되었습니다.");
	 		form.action="insertMemberPro.jsp";
	 		form.method="post";
	 		form.submit();
	 	}
	 </script>
</body>
</html>