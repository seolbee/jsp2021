<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="shopping.ShoppingDAO"/>
	<h1 style="text-align:center">홈쇼핑 회원 등록</h1>
	 <form action="insertMemberPro.jsp" method="post">
	 	<table style="margin: 0 auto" border=1>
	 		<tr>
	 			<td>회원번호(자동발생)</td>
	 			<td><input type="number" value="<%= dao.getCustNo() %>" name="custNo" required readonly></td>
	 		</tr>
	 		<tr>
	 			<td>회원성명</td>
	 			<td><input type="text" name="custname" required></td>
	 		</tr>
	 		<tr>
	 			<td>회원전화</td>
	 			<td><input type="text" name="phone" required></td>
	 		</tr>
	 		<tr>
	 			<td>통신사[SK, KT, LG]</td>
	 			<td>
	 				<input type="radio" name="address" value="SK" required> SK
	 				<input type="radio" name="address" value="KT" required> KT
	 				<input type="radio" name="address" value="LG" required> LG
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>가입일자</td>
	 			<td><input type="date" name="joindate" value="" id="joindate" required></td>
	 		</tr>
	 		<tr>
	 			<td>고객등급[A:VIP, B:일반, C:직원]</td>
	 			<td>
	 				<select name="grade">
	 					<option value="A">A</option>
	 					<option value="B">B</option>
	 					<option value="C">C</option>
	 				</select>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>도시코드</td>
	 			<td><input type="text" name="city"></td>
	 		</tr>
	 		<tr>
	 			<td colspan=2 style="text-align:center">
	 				<input type="button" onclick="validating(this.form)" value="등록">
	 				<button onclick="location.href='selectMember.jsp'">조회</button>
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
	 		console.log(form.custname);
	 		if(form.custname.value.trim() == ""){
	 			alert("회원 성명이 입력되지 않았습니다.");
	 			return;
	 		}
	 		
	 		if(form.phone.value.trim() == ""){
	 			alert("회원 전화가 입력되지 않았습니다.");
	 			return;
	 		}
	 		if(form.address.value.trim() == ""){
	 			alert("통신사가 입력되지 않았습니다.");
	 			return;
	 		}
	 		if(form.city.value.trim() == ""){
	 			alert("도시 코드가 입력되지 않았습니다.");
	 			return;
	 		}
	 		
	 		form.submit();
	 	}
	 </script>
</body>
</html>