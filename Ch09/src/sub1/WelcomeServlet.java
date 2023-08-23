package sub1;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;

public class WelcomeServlet extends HttpServlet {
    @Serial
    private final static long serialVersionUID =1L;
    @Override
    public void init() throws ServletException {
    
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //클라이언트가 GET 요청시
        System.out.println("WelcomeServlet doGet()...");

        //HTML 출력
        resp.setContentType("text/html;charset=UTF-8");

        PrintWriter printWriter= resp.getWriter();
        printWriter.println("<html>");
        printWriter.println("<head>");
        printWriter.println("<meta charset='UTF-8'>");
        printWriter.println("<title>WelcomeServlet</title>");
        printWriter.println("</head>");
        printWriter.println("<body>");
        printWriter.println("<h3>Welcome Servlet</h3>");
        printWriter.println("<a href='./1_Servlet.jsp'>Servlet Main</a>");
        printWriter.println("<a href='./welcome.do'>welcome.do</a>");
        printWriter.println("</body>");
        printWriter.println("</html>");
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    public void destroy() {
        
        
    }
}
