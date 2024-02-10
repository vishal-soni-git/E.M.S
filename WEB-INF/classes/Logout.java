import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.*;
import java.sql.Connection;

@WebServlet("/logoutALL")
public class Logout extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processLogout(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processLogout(request, response);
    }

    private void processLogout(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        PrintWriter pw = null;

        res.setContentType("text/html");
        pw = res.getWriter();

        HttpSession session = req.getSession(false);

        // Invalidate the session if it exists
        if (session != null) {
            session.invalidate();
        }

        pw.println("<html><head>");
        pw.println("<title>Error</title>");
        pw.println("</head><body>");
        // Include JavaScript code to show an alert box
        pw.println("<script>");
        pw.println("alert('You Logout successfully');");
        pw.println("</script>");

        pw.println("</body></html>");
        req.getRequestDispatcher("index.html").include(req, res);

    }

}
