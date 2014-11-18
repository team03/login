<%@page import="java.util.Vector"%>
<%@page import="oxquiz.OxDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script>
	function fnCheck(){
		var answer = document.getElementsByClassName("result2");
		var answer2 = document.getElementsByClassName("result3");
		for(var i=0; i<answer.length; i++){
			if(answer[i].checked==false && answer2[i].checked==false){
			alert((i+1) + "번을 풀지 않았습니다!");
			return;
			}
		}
		f.submit();
	}
</script>
</head>
<body>
<jsp:useBean id="dao" class="oxquiz.OxDao"/> 
<h1>문제 풀기</h1>

<%
Vector v = dao.getQuizList();
OxDto dto=null;
String quiz[] = new String[v.size()];
String quiz2[] = new String[v.size()];
%>
		<form name="f" method="post" action="result_all.jsp">
		<table border=1px width=100% height=10px cellpadding=2 cellspacing=0>
			<tr bgcolor=#FFDF24 height=50px>
				<th align="center"> 번호 </th>
				<th align="center"> 문제 </th>
				<th align="center"> 답 </th>
				<th align="center"> 답선택 </th>
				<th align="center"> 등록자 </th>
				<th align="center"> 등록날짜 </th>
				<th align="center"> 카테고리 </th>
			</tr>
		
		<%
			if(v.isEmpty()){
		%>
		<div align="center">등록된 문제가 없습니다.</div>
		<%
			}
				else{

				for(int i=0; i<v.size(); i++){
				dto= (OxDto)v.get(i);
				quiz[i]=dto.getQuiz();
				quiz2[i]=quiz[i].replace("(", "<b><font color='blue'>(").replace(")", ")</font></b>");
				
		%>
		<tr>
		<tr height=40px>
		
			<td><%=i+1 %></td>
			<td><%=quiz2[i] %></td>
			<td><%=dto.getAnswer() %></td>
			<td><input type="radio" class="result2" name="result<%=i %>" value="1" />1 &nbsp;&nbsp;&nbsp;
			<input type="radio" class="result3" name="result<%=i %>" value="2"/>2</td>			
			<td><%=dto.getUserID() %></td>
			<td><%=dto.getRegdate() %></td>
			<td><%=dto.getCategory() %></td>
		</tr>
		<%
			}

		}
		%>
		</table>
		<br/><br/>

		<input type="button" value="채점하기" onclick="fnCheck()"/>
		</form>
</body>
</html>