
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsp02/Gugudan")
public class Gugudan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Gugudan() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int dan = Integer.parseInt(request.getParameter("dan"));
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>Hello JSP</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>hello jsp</h1>");
		out.println("<h3>" + dan + " 단 </h3>");
		for (int i = 1; i <= 9; i++) {
			out.println("<p>" + dan + " x " + i + " = " + (dan * i) + "</p>");
		}
		// out.println("<a href='/jsp02/GugudanForm'>뒤로가기</a><br>");
		// out.println("<a href='javascript:history.back();'>뒤로가기</a>");
		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet(request, response);
	}

}
