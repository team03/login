package cont;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainFrontController extends HttpServlet{
	@Override

	protected void service(HttpServletRequest req, HttpServletResponse resp)

			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");

		String cmd=req.getParameter("cmd");
		System.out.println(cmd);
		if(cmd.equals("loginForm")){ // ����ȭ��
			resp.sendRedirect("main.html");
		}else if(cmd.equals("login")){ // �α���
			memberlogin.login(req, resp); 
		}else if(cmd.equals("logout")){ // �α׾ƿ�
			memberlogin.logout(req,resp);
		}else if(cmd.equals("m_join")){ // ȸ������ â
			resp.sendRedirect("member_join.html");
		}else if(cmd.equals("m_join_action")){ // ȸ������ dbó��
			memberJoinAction.JoinAction(req,resp);
		}else if(cmd.equals("m_modify")){ // ȸ������ â(���� ���)
			memberModifyAction.Modify(req,resp);
		}else if(cmd.equals("m_modify_action")){ //ȸ������ dbó��
			memberModifyAction.ModifyAction(req,resp);
		}
	}
}
