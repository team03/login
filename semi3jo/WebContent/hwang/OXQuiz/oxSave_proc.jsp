<%@page import="bean.DBConnectionMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<% 
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
 %>
<jsp:useBean id="dao" class="oxquiz.OxDao" />
<jsp:useBean id="dto" class="oxquiz.OxDto" />
<jsp:setProperty property="*" name="dto"/>
<% 
	dao.insertQuiz(dto);
%>
		<script>
			alert("������ ��ϵǾ����ϴ�.");
			location.href="oxMain.jsp";
		</script>