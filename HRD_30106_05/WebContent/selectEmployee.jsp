<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1>�λ�����ý���</h1>
	</header>
	<fieldset>
		<legend>�λ���� ��ȸ</legend>
		<form action="selectListEmployee.jsp">
			<input type="radio" name="type" value="0"> �����ȣ�� ��ȸ
			<input type="text" name="empname">
			<br><br>
			<input type="radio" name="type" value="1"> �μ������� ��ȸ
			<select name="dept">
				<option value="�λ��">�λ��</option>
				<option value="��ȹ��">��ȹ��</option>
				<option value="ȫ����">ȫ����</option>
				<option value="������">������</option>
				<option value="�渮��">�渮��</option>
			</select>
			<button>��ȸ</button>
			<button onclick="location.href='index.jsp'">���</button>
		</form>
	</fieldset>
</body>
</html>