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
		if(cmd.equals("loginForm")){ // 메인화면
			resp.sendRedirect("main.html");
		}else if(cmd.equals("login")){ // 로그인
			memberlogin.login(req, resp); 
		}else if(cmd.equals("logout")){ // 로그아웃
			memberlogin.logout(req,resp);
		}else if(cmd.equals("m_join")){ // 회원가입 창
			resp.sendRedirect("member_join.html");
		}else if(cmd.equals("m_join_action")){ // 회원가입 db처리
			memberJoinAction.JoinAction(req,resp);
		}else if(cmd.equals("m_modify")){ // 회원수정 창(정보 출력)
			memberModifyAction.Modify(req,resp);
		}else if(cmd.equals("m_modify_action")){ //회원수정 db처리
			memberModifyAction.ModifyAction(req,resp);
		}
	}
}
