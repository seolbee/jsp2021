<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="shopping.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dao" class="shopping.ShoppingDAO"/>

<%

	boolean result = dao.insertMember(dto);
	if(result){
%>

<script>
	alert("회원등록 완료");
	history.go(-1);
</script>
<% } %>