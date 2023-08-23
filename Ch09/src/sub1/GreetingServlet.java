package sub1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;

@WebServlet ("/greeting.do")
public class GreetingServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID =1L;
    @Override
    public void init() throws ServletException {
        //서블릿 최초 실행시 시작
        System.out.println("HelloServlet init()...");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //클라이언트가 GET 요청시
        System.out.println("GreetingServlet doGet()...");

        //HTML 출력
        resp.setContentType("text/html;charset=UTF-8");

        PrintWriter printWriter= resp.getWriter();
        printWriter.println("<html>");
        printWriter.println("<head>");
        printWriter.println("<meta charset='UTF-8'>");
        printWriter.println("<title>GreetingServlet</title>");
        printWriter.println("</head>");
        printWriter.println("<body>");
        printWriter.println("<h3>Greeting Servlet</h3>");
        printWriter.println("<a href='./1_Servlet.jsp'>Servlet Main</a>");
        printWriter.println("<a href='./greeting.do'>greeting.do</a>");
        printWriter.println("</body>");
        printWriter.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //클라이언트가 POST 요청시
        System.out.println("HelloServlet doPost()...");
    }

    @Override
    public void destroy() {
        //서블릿 종료시
        System.out.println("HelloServlet destroy()...");
    }
}
