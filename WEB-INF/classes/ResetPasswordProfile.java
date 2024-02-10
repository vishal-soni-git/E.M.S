import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/resetpasswordprofile")
public class ResetPasswordProfile extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) {
        PrintWriter pw = null;
        Connection con = null;

        try {

            res.setContentType("text/html");
            pw = res.getWriter();

            HttpSession session = req.getSession();
            // Retrieve session attributes
            String id = (String) session.getAttribute("id");

            String oldPassword = req.getParameter("oldPassword");
            String newPassword = req.getParameter("newPassword");
            String confirmPassword = req.getParameter("confirmPassword");
            String sqlPassword = null;

            // getting connection
            con = MysqlConnection.getConnection();
            // apply query for setting id number
            PreparedStatement p = con.prepareStatement("select password from employee where id=?");
            p.setString(1, id);
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
                sqlPassword = rs.getString("password");
            }

            PreparedStatement p1 = con.prepareStatement("update employee set password=? where id=?");

            if (sqlPassword.equals(oldPassword)) {
                if (newPassword.equals(confirmPassword)) {
                    p1.setString(1, newPassword);
                    p1.setString(2, id);

                    p1.executeUpdate();

                    pw.println("<html><head>");
                    pw.println("<title>Error</title>");
                    pw.println("</head><body>");
                    // Include JavaScript code to show an alert box
                    pw.println("<script>");
                    pw.println("alert('Your password have been updated');");
                    pw.println("</script>");

                    pw.println("</body></html>");
                    req.getRequestDispatcher("profile.jsp").include(req, res);
                } else {
                    pw.println("<html><head>");
                    pw.println("<title>Error</title>");
                    pw.println("</head><body>");

                    // Include JavaScript code to show an alert box
                    pw.println("<script>");
                    pw.println("alert('Confirm Password and New password does not match!');");
                    pw.println("</script>");

                    pw.println("</body></html>");
                    req.getRequestDispatcher("ResetPassword.html").include(req, res);

                }
            } else {
                pw.println("<html><head>");
                pw.println("<title>Error</title>");
                pw.println("</head><body>");
                // Include JavaScript code to show an alert box
                pw.println("<script>");
                pw.println("alert('Your old Password does not match');");
                pw.println("</script>");

                pw.println("</body></html>");
                req.getRequestDispatcher("ResetPassword.html").include(req, res);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
