<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
%>
<jsp:useBean id="dto" class="shopping.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dao" class="shopping.ShoppingDAO"/>

<%
	boolean result = dao.insertMember(dto);
	if(result){
		session.setAttribute("dto", dto);
%>
<script>
	history.back();
</script>
<% } %>