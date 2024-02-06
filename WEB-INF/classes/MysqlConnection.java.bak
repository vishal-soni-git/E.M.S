import java.sql.*;

public class MysqlConnection {

    private static Connection con = null;

    public static Connection getConnection() throws Exception {
        if (con == null) {
            Class.forName("com.mysql.jdbc.Driver");
            // com.mysql.jdbc.Driver md = new com.mysql.jdbc.Driver();
            // DriverManager.registerDriver(md);

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "2580");
            return con;
        } else {
            return con;
        }

    }

}
