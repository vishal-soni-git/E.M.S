import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/leaveProcess")
public class LeaveProcess extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) {
        PrintWriter pw = null;
        Connection con = null;
        try {

            res.setContentType("text/html");

            String id = req.getParameter("id");
            String type = req.getParameter("type");

            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date sDate1 = dateFormat.parse(req.getParameter("sdate"));
            long ms = sDate1.getTime();
            java.sql.Date sDate = new java.sql.Date(ms);

            Date eDate1 = dateFormat.parse(req.getParameter("edate"));
            long ms1 = eDate1.getTime();
            java.sql.Date eDate = new java.sql.Date(ms1);

            con = MysqlConnection.getConnection();

            PreparedStatement p = con.prepareStatement("select MAX(requestid) from employeeleave");
            ResultSet rs = p.executeQuery();
            int val = 0;
            if (rs.next()) {
                // Retrieve the maximum value from the result set
                val = Integer.parseInt(rs.getString(1)) + 1;

            } else {
                System.out.println("No data found.");
            }

            PreparedStatement ps = con.prepareStatement("insert into employeeleave values(?,?,?,?,?,?)");
            String sval = String.valueOf(val);
            ps.setString(1, sval);
            ps.setString(2, id);
            ps.setString(3, type);
            ps.setDate(4, sDate);
            ps.setDate(5, eDate);
            ps.setString(6, null);

            int i = ps.executeUpdate();

            if (i != 0) {
                System.out.println("One");
            } else {
                System.out.println("Zero");
            }

            res.sendRedirect("leave.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
