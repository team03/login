<%@ page language="java" contentType="text/html; charset=EUC-KR" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ����������</title>
<link rel ="stylesheet" type = "text/css" href="test.css">

	<style type = "text/css">
	<!--
	.tcolor
	{background-color : skyblue; border-color: skyblue;}

	.t2color
	{border-style:inset; border-color:skyblue;}

	-->
	</style>

</head>
<body>
<center>
<br><br><br><br>

	<form method="post" action = "member_modify_ok.ma">
	<input type="hidden" name="cmd" value="m_modify_action">
	<table border  = "1" bordercolor = "blue" bgcolor = "white"  width = "700"	height = "300" align ="center">
	
	<caption><h2>ȸ �� �� �� �� ��</font></h2></caption>

	<tr>
	<td align = "right" class = "tcolor">���̵�</td>
	<td align = "left" class = "t2color">${sessionScope.dto.id }<input type = "hidden" name = "id" value="${sessionScope.dto.id }"></td>
	</tr>
	
	<tr>
	<td align = "right" class = "tcolor">��й�ȣ</td>
	<td align = "left" class = "t2color"><input type = "password" name = "pw" size = "10" value="${sessionScope.dto.pw }"> ��й�ȣ Ȯ�� <input type = "password" name = "pw2" size = "12"> </td>
	</tr>
	
	<tr >
	<td align = "right" class = "tcolor">�̸�</td>
	<td align = "left" class = "t2color"><input type = "text" name = "name" size = "10" value="${sessionScope.dto.name }"></td>
	</tr>

	<tr>
	<td align = "right" class = "tcolor">��ȭ��ȣ</td>
	<td align = "left" class = "t2color"><input type = "text" name = "phone" size = "20" value="${sessionScope.dto.phone }"></td>
	</tr>

	<tr>
	<td align = "right" class = "tcolor">�̸���</td>
	<td align = "left" class = "t2color"><input type = "text" name = "email" size = "20" value="${sessionScope.dto.email }"></td>
	</tr>

	<tr>
	<td align = "right" class = "tcolor">�ּ�</td>
	<td align = "left" class = "t2color"><input type = "text" name = "address" size = "40" value="${sessionScope.dto.address }"></td>
	</tr>

	<tr align = "center">
	<td colspan = 2  class = "t2color"><input type="submit" value="����">&nbsp;<input type="reset" value = ���Է�></td>
	</tr>

	</table>
	</form>
	
</center>
</body>
</html>