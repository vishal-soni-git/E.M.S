<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">


</head>

<body>

    <div class="sidebar">
        <div class="logo"></div>
        <ul class="menu">
            <li>
                <a href="EmployeeDashboard.html" class='active'>
                    <i class="fas fa-tachometer-alt"> </i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="profile.jsp">
                    <i class="fas fa-user"> </i>
                    <span>Profile</span>
                </a>
            </li>
            <li>
                <a href="leave.jsp">
                    <i class="fas fa-bed"> </i>
                    <span>Leave Request</span>
                </a>
            </li>

            <li>
                <a href="attendence.jsp">
                    <i class="fas fa-id-card"> </i>
                    <span>Attendence</span>
                </a>
            </li>


            <li>
                <a href="update.jsp">
                    <i class="fas fa-star"> </i>
                    <span>Updates</span>
                </a>
            </li>

            <li class="logout">
                <a href="index.html">
                    <i class="fas fa-sign-out-alt"> </i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </div>

    <div class='main--content'>
        <div class="header--wrapper">
            <div class="header--title">
                <h2>Profile</h2>
            </div>
            <div class="user--info">
                <img src="./images/emp.jpg" alt="">
            </div>
        </div>
         <div class='content--header'>Employee Information</div>
           <%@ include file="connection.jsp"%>
           <%
                String id=(String)session.getAttribute("id");
                  PreparedStatement ps=con.prepareStatement("select * from employee where id=?");
                  ps.setString(1,id);
                  ResultSet rs=ps.executeQuery();//get data in result set
                  ResultSetMetaData rsmd=rs.getMetaData();
           %>

            <% while(rs.next())
           {
           %>
        <div class='content'>
            <div class='content--info'>
                 <table  class='content--table'>
                     <tr>
                         <td><%=rsmd.getColumnName(1)%></td>
                         <td><%=rs.getString(1)%></td>
                     </tr>
                     <tr>
                         <td><%=rsmd.getColumnName(2)%></td>
                         <td><%=rs.getString(2)%></td>
                     </tr>

                     <tr>
                         <td><%=rsmd.getColumnName(3)%></td>
                         <td><%=rs.getString(3)%></td>
                     </tr>

                     <tr>
                         <td><%=rsmd.getColumnName(4)%></td>
                         <td><%=rs.getString(4)%></td>
                     </tr>

                     <tr>
                         <td><%=rsmd.getColumnName(5)%></td>
                         <td><%=rs.getLong(5)%></td>
                     </tr>

                     <tr>
                         <td><%=rsmd.getColumnName(6)%></td>
                         <td><%=rs.getString(6)%></td>
                     </tr>

                     <tr>
                         <td><%=rsmd.getColumnName(7)%></td>
                         <td><%=rs.getString(7)%></td>
                     </tr>

                      <tr>
                          <td><%=rsmd.getColumnName(8)%></td>
                          <td><%=rs.getString(8)%></td>
                      </tr>

                </table>
            </div>


             <div class='content--image'>
                       <%
                 // Retrieve the image data from the request attribute
                     byte[] imageData = rs.getBytes(9);

                 // Convert byte array to base64 string
                 String base64Image = java.util.Base64.getEncoder().encodeToString(imageData);
                   %>
                 <img src="data:image/jpeg;base64, <%= base64Image %>" alt="Database Image">
               </div>

           </div>

            <%
             }
             %>


    </div>

</body>

</html>
