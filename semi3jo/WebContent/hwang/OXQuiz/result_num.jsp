<%@page import="java.util.Vector"%>
<%@page import="oxquiz.OxDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="oxquiz.OxDao" />
<h1>OX ���� ä�� ���</h1>
<%
request.getParameter("euc-kr");

Vector v = dao.getQuizList_num();
OxDto dto=null;

int cnt=0;
String param[] = new String[v.size()];
for(int i=0; i<v.size(); i++){
	param[i] =(String)request.getParameter("result"+i);
	dto= (OxDto)v.get(i);
	if(param[i].equals(dto.getAnswer()))
		cnt++;
}
%>

		<form name="f" method="post" action="result.jsp">
		<table border=1px width=100% height=10px cellpadding=2 cellspacing=0>
			<tr bgcolor=#FFDF24 height=50px>
				<td align="center"> ��ȣ </td>
				<td align="center"> ���� </td>
				<td align="center"> ���� </td>
				<td align="center"> �����Ѵ� </td>
				<td align="center"> ����� </td>
				<td align="center"> ��ϳ�¥ </td>
			</tr>
		
		<%
			for(int i=0; i<v.size(); i++){
				dto= (OxDto)v.get(i);
		%>
		<tr>
		<tr height=40px>
		
			<td><%=i+1 %><%if(!param[i].equals(dto.getAnswer())){ %>
				<img src="/semi3jo/hwang/images/x.jpg" width = 40 height= 40/> <%}else{ %>
				<img src="/semi3jo/hwang/images/o.jpg" width = 40 height= 40/><%} %></td>
			<td><%=dto.getQuiz() %></td>
			<td><%=dto.getAnswer() %></td>
			<td><%=param[i] %></td>
			<td><%=dto.getUserID() %></td>
			<td><%=dto.getRegdate() %></td>
		</tr>
		<%
			}
		
		%>
		</table>
		<br/><br/><br/>
		<h1>�����ؼ�</h1>
		
		<%
			for(int i=0; i<v.size(); i++){
				dto= (OxDto)v.get(i);
		%>
		
		<b><%=i+1%>��:</b> 	<%=dto.getExplanation() %><br/>
		
		<%
			}
		%>
		
<br/><br/><br/>
<h3>����� ������ <%=cnt %></h3>

<a href="oxMain.jsp">ó������</a>


</body>
</html>