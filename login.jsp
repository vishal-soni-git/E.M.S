
<%@ include file="connection.jsp"%>
<%@ page errorPage="error.jsp" %>

<%

String id=request.getParameter("id");
String password=request.getParameter("password");
String user=request.getParameter("User");

 PreparedStatement ps=con.prepareStatement("select * from employee where id=? AND password=?");
 ps.setString(1,id);
 ps.setString(2,password);
ResultSet rs=ps.executeQuery();//get data in result set

boolean status=false;

status=rs.next();


if(user.equals("employee"))
{
if(status)
{
    session.setAttribute("id",id);
    response.sendRedirect("EmployeeDashboard.html");
}
else
{
    out.println("Please Enter Valid Info");
    response.sendRedirect("index.html");
}
}
else{
    if(id.equals("AVSMN") && password.equals("2580"))
     {
       session.setAttribute("id",id);
       response.sendRedirect("AdminDashboard.html");
    }
    else
    {
      out.println("Please Enter Valid Info");
      response.sendRedirect("index.html");
    }
}
%>
