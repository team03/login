<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>���� ���</h1>
	<center>
		<br>
		<br>
		<table width=80% cellspacing=0 cellpadding=3>
			<tr>
				<td bgcolor=84F399 height=25 align=center>���� ���</td>
			</tr>
		</table>
		<br>
		<table width=80% cellspacing=0 cellpadding=3 align=center>
			<form name=post method=post action="oxSave_proc.jsp">
				<tr>
					<td align=center>
						<table border=0 width=100% align=center>
							<tr>
								<td width=10%>USER ID</td>
								<td width=90%><input type=text name=userID size=10
									maxlength=10></td>
								<td width=10%>ī�װ�</td>
								<td><select name="category">
										<option value="word">�ܾ�</option>
										<option value="num">��</option>
										<option value="voice">��</option>
										<option value="tense">����</option>
								</select>
								<td>
							</tr>
							<tr>
							<td width=10%>����</td>
							<td width=90%><input type=text name=quiz size=100
								maxlength=100></td>
							</tr>
							<tr>
								<td width=10%>��</td>
								<td width=90%><input type=text name=answer size=10
									maxlength=10></td>
							<tr>
								<td width=10%>�ؼ�</td>
								<td width=90%><textarea name=explanation rows=3 cols=100></textarea></td>
							</tr>
							<td colspan=2><hr size=1></td>
							</tr>
							<tr>
								<td><input type=submit value="���">&nbsp;&nbsp; <input
									type=reset value="�ٽþ���">&nbsp;&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</form>
		</table>
	</center>
</body>
</html>