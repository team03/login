<%@page import="totalsite.board.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<jsp:useBean id="dao" class="totalsite.board.BoardDao"/>
<jsp:useBean id="dto" class="totalsite.board.BoardDto"/>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	
	int num = Integer.parseInt(request.getParameter("num")); //�۹�ȣ �Ѱܹް�
	String userPass = request.getParameter("pass"); //�н����� �Ѱܹް�
	
	dto = dao.getBoard(num); // dto�� dao�� ���� �Խñ� ���� �Ѱܹޱ�	
	
	if(userPass.equals(dto.getPass())){
		dto = new BoardDto();
		 
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setNum(num);
		dao.updateBoard(dto);
%>
	<script>
		alert("�� �����Ǿ����ϴ�.");
		location.href="List.jsp";
	</script>
		<%
	}
	else{
%>		
	<script>
		alert("�н����尡 ���� �ʽ��ϴ�.");
		history.back();
	</script>
<%		
	}
%>
