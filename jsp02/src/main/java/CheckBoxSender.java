
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsp02/CheckBoxSender")
public class CheckBoxSender extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckBoxSender() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>Hello JSP</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Check Box 데이터 보내기</h1>");
		out.println("<form method='GET' action='/jsp02/CheckBoxReceiver'>");
		out.println("<p>관심 분야를 선택하세요.</p>");
		out.println("<input type='checkbox' name='interest' value='자바'><span>자바</span>");
		out.println("<input type='checkbox' name='interest' value='파이썬'><span>파이썬</span>");
		out.println("<input type='checkbox' name='interest' value='자바스크립트'><span>자바스크립트</span>");
		out.println("<input type='checkbox' name='interest' value='C'><span>C</span>");
		out.println("<input type='checkbox' name='interest' value='Go'><span>Go</span>");
		out.println("<button>send</button>");
		out.println("</form>");
		// out.println("<a href=''>뒤로가기</a><br>");
		// out.println("<a href='javascript:history.back();'>뒤로가기</a>");
		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
