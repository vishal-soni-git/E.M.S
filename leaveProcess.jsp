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
                <a href="AdminDashboard.html" class='active'>
                    <i class="fas fa-tachometer-alt"> </i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-user"> </i>
                    <span>Account</span>
                </a>
            </li>
            <li>
                <a href="leaveProcess.jsp">
                    <i class="fas fa-bed"> </i>
                    <span>Leave Management</span>
                </a>
            </li>

            <li>
                <a href="#">
                    <i class="fas fa-id-card"> </i>
                    <span>Attendence Management</span>
                </a>
            </li>


            <li>
                <a href="uploadUpdates.jsp">
                    <i class="fas fa-star"> </i>
                    <span>Upload Updates</span>
                </a>
            </li>

            <li class="logout">
                <a href="logoutALL">
                    <i class="fas fa-sign-out-alt"> </i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </div>

    <div class='main--content'>
        <div class="header--wrapper">
            <div class="header--title">
                <h1>Leave Management System</h1>
            </div>
            <div class="user--info">
                <img src="./images/emp.jpg" alt="">
            </div>
        </div>

        <div class='content--header'>Leave Management </div>

       <%@ page errorPage="error.jsp" %>
     <%@ include file="connection.jsp"%>
           <%
                  PreparedStatement ps=con.prepareStatement("select * from employeeleave where status IS NULL ORDER BY requestid ASC");
                  ResultSet rs=ps.executeQuery();//get data in result set
           %>



    <div class='show--table'>
    <table class='show--table--content'>
        <tr>
            <th>Request ID</th>
            <th>ID</th>
            <th>Leave Type</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Status</th>
            <th>Take Action</th>
        </tr>
        <% while(rs.next())
           {
           %>
        <tr>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getDate(4) %></td>
                <td><%= rs.getDate(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td>
                   <form action="http://localhost:6060/EMS-dumy/leaveManagement" method="post">
                   <input type="hidden" name="requestId" value="<%= rs.getString(1) %>">
                    <input type="hidden" name="id" value="<%= rs.getString(2) %>">
                     <button name="submitButton" value="accept" type="submit">Accept</button>

                   </form>
                   <form action="http://localhost:6060/EMS-dumy/leaveManagement" method="post">
                      <input type="hidden" name="requestId" value="<%= rs.getString(1) %>">
                      <input type="hidden" name="id" value="<%= rs.getString(2) %>">
                     <button name="submitButton" value="reject" type="submit">Reject</button>
                   </form>
                </td>
        </tr>
          <% } %>
 </div>

    </div>


</body>

</html>
