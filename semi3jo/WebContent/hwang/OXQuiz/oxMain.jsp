<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link href="/BootstrapApp/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="/BootstrapApp/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<h1>OX����</h1>

<div class="span4">
			<div class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				���� �ҷ�����<i class="caret"></i></a>
				<ul class="dropdown-menu">
					<li><a href="oxLoad_all.jsp">All</a></li>
					<li class="divider"/>
					<li><a href="oxLoad_word.jsp">�ܾ�</a></li>
					<li class="divider"/>
					<li><a href="oxLoad_num.jsp">��</a></li>
					<li class="divider"/>
					<li><a href="oxLoad_voice.jsp">��</a></li>
					<li class="divider"/>
					<li><a href="oxLoad_tense.jsp">����</a></li>
	
				</ul>
			</div>
</div>
<div class="span4">
<a href="oxSave.jsp">���� ����ϱ�</a><br/>
</div>
</body>
</html>