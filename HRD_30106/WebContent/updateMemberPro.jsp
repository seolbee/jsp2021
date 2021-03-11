<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="shopping.ShoppingDAO"/>
<jsp:useBean id="dto" class="shopping.MemberDTO"/>
<jsp:setProperty name="dto" property="*"/>

<%
	boolean result = dao.updateMember(dto);	
	if(result){
		session.setAttribute("msg", "회원정보 수정 성공");
%>
<script>
	location.href="updateMember.jsp?custno=<%= dto.getCustno()%>";
</script>
<%
	}
%>
</body>
</html>