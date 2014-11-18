package cont;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.JoinDAO;
import bean.JoinDTO;

public class memberModifyAction extends HttpServlet{
	protected static void Modify(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session=req.getSession();
		
		JoinDAO dao = new JoinDAO();
		JoinDTO dto = new JoinDTO();
		
		String id = (String)session.getAttribute("id");
		dto = dao.getMemberInfo(id);
		
		session.setAttribute("dto",dto);
		resp.sendRedirect("member_modify.jsp");
	}
	
	protected static void ModifyAction(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		System.out.println("회원 수정 처리 시작 . . . ");

		JoinDAO dao = new JoinDAO();
		JoinDTO dto = new JoinDTO();

		String id = (String)req.getParameter("id");
		String pw = (String)req.getParameter("pw");
		String name = (String)req.getParameter("name");
		String phone = (String)req.getParameter("phone");
		String email = (String)req.getParameter("email");
		String address = (String)req.getParameter("address");	

		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setEmail(email);
		dto.setAddress(address);
		dao.updateJoin(dto);

		System.out.println("회원 수정 처리 끝 . . . ");

		resp.sendRedirect("mypage.jsp");
	}
}
