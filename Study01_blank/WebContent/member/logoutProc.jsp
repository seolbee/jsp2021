<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.getAttribute("loginId") != null){
			session.removeAttribute("loginId");
	%>
		<script>
			alert("로그아웃 됨");
			location.href="loginForm_sub.jsp";
		</script>
	<%
		} else {
	%>
		<script>
			alert("로그인 되지 않았으므로 돌아갑니다.");
			history.go(-1);
		</script>
	<%
		}
	%>
</body>
</html>