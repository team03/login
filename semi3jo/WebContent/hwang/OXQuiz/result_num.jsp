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
<h1>OX 퀴즈 채점 결과</h1>
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
				<td align="center"> 번호 </td>
				<td align="center"> 문제 </td>
				<td align="center"> 정답 </td>
				<td align="center"> 선택한답 </td>
				<td align="center"> 등록자 </td>
				<td align="center"> 등록날짜 </td>
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
		<h1>정답해설</h1>
		
		<%
			for(int i=0; i<v.size(); i++){
				dto= (OxDto)v.get(i);
		%>
		
		<b><%=i+1%>번:</b> 	<%=dto.getExplanation() %><br/>
		
		<%
			}
		%>
		
<br/><br/><br/>
<h3>당신의 점수는 <%=cnt %></h3>

<a href="oxMain.jsp">처음으로</a>


</body>
</html>