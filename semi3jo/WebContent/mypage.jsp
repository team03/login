<%@ page language="java" contentType="text/html; charset=EUC-KR"

    pageEncoding="EUC-KR"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>

</head>

<body>

<!-- �α��� �ߴ��� �˻��ϱ� empty�� ���ǽ������� login�� �ֳ������� Ȯ����-->
<c:if test="${empty sessionScope.id }">

	<script type="text/javascript">

		alert("�α��� �� �̿��� �ּ���.");

		location.href="login.do?cmd=loginForm";

	</script>

</c:if>



<!-- sessionScope��ü�� ��������! -->

<!-- login.id�ϸ� login�� dto��ü�� ����� �����Ƿ� �׾��� id�� �̾Ƴ����ٴ��ǹ� -->

<jsp:include page="right.html" flush="true"/> 

<br/><br/><br/><br/>
[${sessionScope.id }]�� ȯ���մϴ�.<br/>

����� mypage�Դϴ�.<br/>
<a href="member_modify.ma?cmd=m_modify">ȸ������</a>&nbsp;&nbsp;/&nbsp;&nbsp; 
<a href="login.ma?cmd=logout">�α׾ƿ�</a> 
</body>

</html>