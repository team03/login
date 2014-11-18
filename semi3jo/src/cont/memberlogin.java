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
		System.out.println("�α��� ó�� ���� . . . ");
		
		
		JoinDTO dto = new JoinDTO();
		JoinDAO dao = new JoinDAO();
		
		dto.setId(req.getParameter("id"));
		dto.setPw(req.getParameter("pw"));
		
		int result = dao.login(dto);
		if(result==1){ //���̵� ��й�ȣ�� ��� �´°��
			HttpSession session=req.getSession();
			//ȸ�� ������ ������ ��� ���̵� ���ǿ� ����ϱ� ���� ���� ��ü�� �����Ѵ�.
			
			String id = (String)dto.getId();
			session.setAttribute("id", id);
			
			//4. ���������� �̵��ϱ�

			resp.sendRedirect("mypage.jsp");
		}else if(result==0){//���̵� �Ǵ� ��й�ȣ�� Ʋ�����

			String msg="���̵� �Ǵ� ��й�ȣ�� Ʋ����!";

			req.setAttribute("errMsg", msg);

			req.getRequestDispatcher("err.jsp").forward(req, resp);

		}else{//�ͼ����� �߻��Ѱ��

			String msg="�������� �����߻�!";

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
