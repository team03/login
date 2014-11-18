<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="totalsite.board.BoardDto" %>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<jsp:useBean id="dao" class="totalsite.board.BoardDao"/> <!-- Dao�� ���� ���� �ν��Ͻ� ���� -->
</head>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	int num = Integer.parseInt(request.getParameter("num"));
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	BoardDto dto = dao.getBoard(num); // �Լ� ȣ��
	pageContext.setAttribute("dto", dto);
%>
<body>
<br><br> 
<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=#FFDF24 height=25 align=center class=m>���б�</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	 <td align=center bgcolor=#FFBB00 width=10%> �� �� </td>
	 <td bgcolor=#ffffe8><%=dto.getName() %></td>
	 <td align=center bgcolor=#FFBB00 width=10%> ��ϳ�¥ </td>
	 <td bgcolor=#ffffe8><%=dto.getRegdate() %></td>
	</tr>
    <tr>
	 <td align=center bgcolor=#FFBB00 width=10%> �� �� </td>
	 <td bgcolor=#ffffe8 ><%=dto.getEmail() %></td> 
	 <td align=center bgcolor=#FFBB00 width=10%> Ȩ������ </td>
	 <td bgcolor=#ffffe8 ><a href="http://" target="_new">http://<%=dto.getHomepage() %></a></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#FFBB00 width=10%> �� ��</td>
     <td bgcolor=#ffffe8><%=dto.getSubject() %>
     <td align=center bgcolor=#FFBB00 width=10%>÷������</td>
     <td bgcolor=#ffffe8><a href="download.jsp?name=<%=dto.getFilename() %>"><%=dto.getOfilename() %></a>
   
     </td>
     
   </tr>
   <tr>
   <td>
   <%=dto.getContent() %>
   </td>
   </tr>
   <tr>
   <td colspan="4">
   <img alt="" src="/semi3jo/hwang/upload/<%=dto.getFilename() %>">
   
   </td>
   </tr>
   <tr> 
    <td colspan=4></td>
   </tr>
    <td colspan=4 align=right>
     <%=dto.getIp() %>�� ���� ���� ����̽��ϴ�./  ��ȸ�� :<%=dto.getCount() %> 
   </td>
 
   </table>
  </td>
 </tr>
 <tr>
   <td align=center colspan=2> 
	<hr size=1>
	[ <a href="javascript:document.list.submit()">�� ��</a> | 
	<a href="Update.jsp?num=<%=num%>">�� ��</a> |
	<a href="Reply.jsp?num=<%=num%>">�� ��</a> |
	<a href="Delete.jsp?num=<%=num%>">�� ��</a> ]<br>
  </td>
 </tr>
</table>
<form name="list" method="post" action="List.jsp">
	<input type="hidden" name="keyField" value="<%=keyField %>" />
	<input type="hidden" name="keyWord" value="<%=keyWord %>" />
</form>
</body>
</html>
