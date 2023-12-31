<%@ page import="java.sql.*"%>
        <%
                Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "2580");//get connection
        %>
