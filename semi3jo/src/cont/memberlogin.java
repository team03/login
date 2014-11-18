package cont;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.JoinDAO;
import bean.JoinDTO;

public class memberlogin extends HttpServlet{
	protected static void login(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("로그인 처리 시작 . . . ");
		
		
		JoinDTO dto = new JoinDTO();
		JoinDAO dao = new JoinDAO();
		
		dto.setId(req.getParameter("id"));
		dto.setPw(req.getParameter("pw"));
		
		int result = dao.login(dto);
		if(result==1){ //아이디 비밀번호가 모두 맞는경우
			HttpSession session=req.getSession();
			//회원 인증에 성공할 경우 아이디를 세션에 등록하기 위해 세션 객체를 생성한다.
			
			String id = (String)dto.getId();
			session.setAttribute("id", id);
			
			//4. 뷰페이지로 이동하기

			resp.sendRedirect("mypage.jsp");
		}else if(result==0){//아이디 또는 비밀번호가 틀린경우

			String msg="아이디 또는 비밀번호가 틀려요!";

			req.setAttribute("errMsg", msg);

			req.getRequestDispatcher("err.jsp").forward(req, resp);

		}else{//익셉션이 발생한경우

			String msg="내부적인 오류발생!";

			req.setAttribute("errMsg", msg);

			req.getRequestDispatcher("err.jsp").forward(req, resp);
		}

	}

	protected static void logout(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		HttpSession session=request.getSession();

		session.invalidate();

		response.sendRedirect("main.html");
	}

}
