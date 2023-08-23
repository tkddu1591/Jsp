package sub1;

import sub3.MySessionListener;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;

public class HelloServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        //서블릿 최초 실행시 시작
        System.out.println("HelloServlet init()...");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //클라이언트가 GET 요청시
        System.out.println("HelloServlet doGet()...");

        //HTML 출력
        resp.setContentType("text/html;charset=UTF-8");

        PrintWriter printWriter = resp.getWriter();
        printWriter.println("<html>");
        printWriter.println("<head>");
        printWriter.println("<meta charset='UTF-8'>");
        printWriter.println("<title>HelloServlet</title>");
        printWriter.println("</head>");
        printWriter.println("<body>");
        printWriter.println("<h3>Hello Servlet</h3>");
        printWriter.println("<a href='./1_Servlet.jsp'>Servlet Main</a>");
        printWriter.println("<a href='./hello.do'>hello.do</a>");
        printWriter.println("</body>");
        printWriter.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //클라이언트가 POST 요청시
        System.out.println("HelloServlet doPost()...");
        String uid = req.getParameter("uid");
        String pass = req.getParameter("pass");

        //현재 세션 가져오기
        HttpSession session = req.getSession();

        //사용자가 a101, a102라고 가정하고 로그인 처리

        if (uid.equals("a101") && pass.equals("1234")) {
            session.setAttribute("sessUid", uid);
            session.setAttribute("sessPass", pass);
            resp.sendRedirect("./3_Listener.jsp?success=200");
        } else{
            resp.sendRedirect("./3_Listener.jsp?success=201");
        }

    }

    @Override
    public void destroy() {
        //서블릿 종료시
        System.out.println("HelloServlet destroy()...");
    }
}
