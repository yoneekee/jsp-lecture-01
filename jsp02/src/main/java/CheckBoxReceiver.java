
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsp02/CheckBoxReceiver")
public class CheckBoxReceiver extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckBoxReceiver() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] checkeds = request.getParameterValues("interest");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>Hello JSP</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Check Box 데이터 받기</h1>");
		out.println("<ul>");
		for (int i = 0; i < checkeds.length; i++) {
			out.println("<li>" + (i + 1) + " : " + checkeds[i] + "</li>");
		}
		out.println("</ul>");
		out.println("<a href='javascript:history.back();'>뒤로가기</a>");
		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
