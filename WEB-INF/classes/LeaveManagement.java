import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/leaveManagement")
public class LeaveManagement extends HttpServlet {
    private PrintWriter pw = null;
    private Connection con = null;
    private PreparedStatement p = null, ps = null;
    private int result = 0;
    String email;

    public void doPost(HttpServletRequest req, HttpServletResponse res) {

        try {

            res.setContentType("text/html");

            PrintWriter pw = res.getWriter();

            String requestId = req.getParameter("requestId");
            String type = req.getParameter("submitButton");
            String id = req.getParameter("id");

            pw.println(type);

            con = MysqlConnection.getConnection();

            if (type.equals("accept")) {

                p = con.prepareStatement("UPDATE employeeleave SET status = 'Accept' WHERE requestid = ?");
                p.setString(1, requestId);
                result = p.executeUpdate();
                if (result != 0) {
                    System.out.println("One");
                } else {
                    System.out.println("Zero");
                }

                ps = con.prepareStatement("select email from employee where id=?");
                ps.setString(1, id);

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    email = rs.getString("email");
                }

                String message = "Dear Employee,\r\n Your leave is accepted \r\n your request ID is: " + requestId
                        + "\r\n your id is :" + id
                        + "\r\n and accepting your leave";
                String subject = "Leave Acceptence";
                String to = email;
                String from = "cinestar569@gmail.com";
                Mail.sendEmail(message, subject, to, from);
                res.sendRedirect("leaveProcess.jsp");
            }

            else if (type.equals("reject")) {

                p = con.prepareStatement("UPDATE employeeleave SET status = 'Reject' WHERE requestid = ?");
                p.setString(1, requestId);
                result = p.executeUpdate();
                if (result != 0) {
                    System.out.println("One");
                } else {
                    System.out.println("Zero");
                }

                ps = con.prepareStatement("select email from employee where id=?");
                ps.setString(1, id);
                String email;
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {

                    String message = "Dear Employee,\r\n Your leave is rejected \r\n your request ID is: " + requestId
                            + "\r\nyour id is :" + id
                            + "\r\n and rejecting your leave due to some reason";
                    String subject = "Leave Rejected";
                    String to = rs.getString("email");
                    ;
                    String from = "cinestar569@gmail.com";
                    Mail.sendEmail(message, subject, to, from);
                    res.sendRedirect("leaveProcess.jsp");
                }

            } else {
                res.sendRedirect("error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
