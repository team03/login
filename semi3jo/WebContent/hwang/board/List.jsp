<%@page import="totalsite.board.BoardDto"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html;charset=euc-kr" %>

<%!public String getParam(HttpServletRequest req, String pname){
		if(req.getParameter(pname) != null){
			return req.getParameter(pname);
		}
		else{
			return "";
		}
	
	} 

	//����¡�� �ʿ��� ������
	int totalRecord = 0; //��ü ���� ����
	int numPerPage = 5; //�� �������� ������ ���� ����
	int pagePerBlock = 3; //�� ���� ������ �������� ���� (block: ������������ �����ִ� ����)
	int totalPage = 0; //��ü �������� ���� 
	int totalBlock = 0; //��ü ���� ����
	int nowPage = 0; //���� ������ ������ ��ȣ
	int nowBlock = 0; //���� ������ �� 
	int beginPerPage = 0; //������ �� ���۹�ȣ%>

<HTML>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("�˻�� �Է��ϼ���.");
			document.search.keyWord.focus();
			return;
			
		}
		document.search.submit();
	}
	
	function fnRead(param){
		document.read.num.value = param;
		document.read.submit(); // read��� ���� ����(submit)�ϰڴ�. Read.jsp���� 
	}
</script>
<BODY>
<jsp:useBean id="dao" class="totalsite.board.BoardDao"/> <!-- ��ߵ� Ŭ���� �ν��Ͻ� ���� -->
<%
	request.setCharacterEncoding("euc-kr");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	if(keyField == null){
		keyField = "name";
	}
	
	if(keyWord == null){
		keyWord = "";
	}
	
	Vector v = dao.getBoardList(keyField, keyWord); 
	BoardDto dto=null;
	
	totalRecord = v.size(); // ��ü ���� ���� 
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage); // ��ü �������� ����
	
	if(request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	if(request.getParameter("nowBlock") != null)
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
	
	beginPerPage = numPerPage * nowPage;
%>
<center><br>
<h2>JSP Board</h2>

<table align=center border=0 width=80%>
<tr>
	<td align=left>Total : <%=totalRecord%> Articles(
		<font color=red>  <%=nowPage+1%> / <%=totalPage%> Pages </font>)
	</td>
</tr>
</table>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
	<td align=center colspan=2>
		<table border=0 width=100% cellpadding=2 cellspacing=0>
			<tr bgcolor=#FFDF24 height=120%>
				<td align="center" width="10%"> ��ȣ </td>
				<td align="center" width="50%"> ���� </td>
				<td align="center" width="10%"> �̸� </td>
				<td align="center" width="20%"> ��¥ </td>
				<td align="center" width="10%"> ��ȸ�� </td>
			</tr>
		<%
			if(v.isEmpty()){
		%>
		<div align="center"><b>��ϵ� ���� �����ϴ�.</b></div>
		<%
			}
				else{
			for(int i=beginPerPage; i<beginPerPage+ numPerPage; i++){
				if(i == totalRecord)
					break;
				dto= (BoardDto)v.get(i);
		%>
		<tr>
			<td align="center"><%=dto.getNum() %></td>
			<td><%=dao.useDepth(dto.getDepth()) %>
				<%if(dto.getDepth() >0){ %>
				<img src="../images/re.gif" /> <%} %>
			<a href="javascript:fnRead('<%=dto.getNum()%>')"><%=dto.getSubject() %></a></td>
			<td align="center"><%=dto.getName() %></td>
			<td align="center"><%=dto.getRegdate() %></td>
			<td align="center"><%=dto.getCount() %></td>
		</tr>
		<%
			}
		}
		%>
		</table>
	</td>
</tr>
<tr>
	<td><BR><BR></td>
</tr>
<tr>
	<td align="left">Go to Page&nbsp;&nbsp;
	
	<%
		if(nowBlock > 0){
	%>
		&nbsp;&nbsp;::: <a href="List.jsp?nowPage=<%=((nowBlock-1) * pagePerBlock) %>&nowBlock=<%=nowBlock-1%>">����</a>&nbsp;&nbsp;
	<%
		}
	%>
		<%
		for(int i=0; i<pagePerBlock; i++){
			if((nowBlock*pagePerBlock) + i == totalPage)
				break;
	%>
		<a href="List.jsp?nowPage=<%=(nowBlock * pagePerBlock)+i %>&nowBlock=<%=nowBlock%>"><%= i+1 +(nowBlock * pagePerBlock) %></a>&nbsp;&nbsp;
	
	<%		
		}
	%>
	
	<%
		if(totalBlock > nowBlock+1){
	%>		
		::: <a href="List.jsp?nowPage=<%=((nowBlock+1) * pagePerBlock) %>&nowBlock=<%=nowBlock+1%>">����</a>
	<%	
		}
	%>
		
	 </td>

	<td align=right>
		<a href="Post.jsp">[�۾���]</a>
		<a href="List.jsp">[ó������]</a>
	</td>
</tr>
</table>
<BR>
<form action="List.jsp" name="search" method="post">
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
			<select name="keyField" size="1">
				<option value="name" <%if(keyField.equals("name")){%> selected="true"<%} %>> �̸� </option>
				<option value="subject" <%if(keyField.equals("subject")){%> selected="true"<%} %>> ���� </option>
				<option value="content" <%if(keyField.equals("content")){%> selected="true"<%} %>>���� </option>
			</select>

			<input type="text" size="16" name="keyWord" value='<%=getParam(request, "keyWord" ) %>' >
			<input type="button" value="ã��" onClick="check()">
			<input type="hidden" name="page" value= "0">
		</td>
	</tr>
	</table>
</form>
</center>
<form name="read" method="post" action="Read.jsp">
	<input type="hidden" name="num"/>
	<input type="hidden" name="keyField" value="<%=keyField %>" />
	<input type="hidden" name="keyWord" value="<%=keyWord %>" />
</form>
</BODY>
</HTML>