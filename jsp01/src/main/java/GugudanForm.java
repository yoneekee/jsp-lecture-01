
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GugudanForm")
public class GugudanForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GugudanForm() {
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
		out.println("<title>구구단을 선택해 주세요.</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<form action='/jsp01/GugudanResult' method='GET'>"
				+ "<input type='text' name='num'>"
				+ "<button>구구단 출력해 주세요.</button>"
				+ "</form>");	
		out.println("</body>");
		out.println("</html>");
	}

}
