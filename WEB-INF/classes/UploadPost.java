import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import java.time.LocalDate;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100) // 100mb
@WebServlet("/uploadpost")
public class UploadPost extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) {
        PrintWriter pw = null;
        Connection con = null;
        InputStream inputStream = null; // input stream of the upload file
        ByteArrayOutputStream outputStream = null;

        try {

            res.setContentType("text/html");

            HttpSession session = req.getSession();

            // Retrieve session attributes
            String userid = (String) session.getAttribute("id");
            String title = req.getParameter("title");

            // obtains the upload file part in this multipart request

            // FETCHING input file image
            Part filePart = req.getPart("post");

            if (filePart != null) {
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

                inputStream = filePart.getInputStream();
            }

            // setting posting date of docs.
            LocalDate date = LocalDate.now();

            // getting connection
            con = MysqlConnection.getConnection();
            // apply query for setting id number
            PreparedStatement p = con.prepareStatement("select MAX(id) from uploadpost");
            ResultSet rs = p.executeQuery();
            int val = 0;
            if (rs.next()) {
                // Retrieve the maximum value from the result set
                String lval = rs.getString(1);
                if (lval != null) {
                    val = Integer.parseInt(lval) + 1;
                } else {
                    val = 1;
                }
            } else {
                System.out.println("No data found.");
            }
            // apply query for insert all data
            PreparedStatement ps = con.prepareStatement("insert into uploadpost values(?,?,?,?,?)");

            ps.setInt(1, val);
            ps.setString(2, title);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                // ps.setBytes(3, imageData);
                ps.setBinaryStream(3, inputStream, (int) filePart.getSize());

            }
            ps.setDate(4, java.sql.Date.valueOf(date));
            ps.setString(5, userid);

            int i = ps.executeUpdate();

            res.sendRedirect("uploadUpdates.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
