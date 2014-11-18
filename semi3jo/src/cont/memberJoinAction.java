package cont;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.JoinDAO;
import bean.JoinDTO;

public class memberJoinAction extends HttpServlet{
	protected static void JoinAction(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		System.out.println("회원 가입 신청 처리 시작 . . . ");
		
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
		dao.insertJoin(dto);
		
		System.out.println("회원 가입 신청 처리 끝 . . . ");
		
		resp.sendRedirect("member_ok.html"); //회원가입완료
	}
}
