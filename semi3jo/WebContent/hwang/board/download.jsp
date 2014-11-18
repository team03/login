<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.io.*"%>

<%
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");
	String realPath = getServletContext().getRealPath("hwang/upload"); // ���� ��� �غ� 
	System.out.println(realPath);
	response.setContentType("Application/octet-stream"); // ���� ������ ������ contentŸ�� ���� -> ���Ƿ� ���� ����
															//octet stream �ٿ�ε� ���� �� �ɰ��� ������� 
	response.setHeader("content-Disposition", "attachment;filename=" + name);
	
	File f = new File(realPath + "/" + new String(name.getBytes("8859_1"), "euc-kr"));
	byte[] data = new byte[1024]; // 1024����Ʈ�� ��� ����

	try{
		BufferedInputStream input = new BufferedInputStream(new FileInputStream(f));
		
		BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream());
		
		int read = input.read(data); // 1024����Ʈ ��ŭ�� �о���δ� 
		while(read != -1){
			output.write(data, 0, read);
			read = input.read(data);
		}
		output.close();
		output.flush();
		input.close();
		
	}
	
	catch(Exception err){
		err.printStackTrace();
	}
%>