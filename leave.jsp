<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="style.css"/>
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
            <h2>Leave Requests</h2>
        </div>
        <div class="user--info">
            <img src= "./images/emp.jpg" alt="">
        </div>
    </div>
    <div class='content--header'>Taking Leave</div>

     <div class='content--form'>

         <form action="http://localhost:6060/EMS-dumy/leaveProcess" class='form--design'method="POST">
             <label for="id">ID :</label>
             <input type="text" placeholder='ID' name='id' id="myInput"><br><br>

             <label for="User">Leave Type</label>
             <select class='user--select' id="type" name="type">
                 <option value="Sick Leave">Sick Leave</option>
                 <option value="Vacation Leave">Vacation Leave</option>
                 <option value="Personal Leave">Personal Leave</option>
                 <option value="Parental Leave">Parental Leave</option>
                 <option value="Bereavement Leave">Bereavement Leave</option>
                 <option value="Public Holidays">Public Holidays</option>
                 <option value="Compensatory Time">Compensatory Time</option>
                 <option value="Unpaid Leave">Unpaid Leave</option>
             </select><br><br>

             <label for="sdate">Start Date</label>
             <input type="date" name="sdate" id="myInput"><br><br>

             <label for="edate">End Date</label>
             <input type="date" name="edate" id="myInput"><br><br>

             <button class='button--click' type="submit">Submit</button>
         </form>
    </div>
     <%@ page errorPage="error.jsp" %>
     <%@ include file="connection.jsp"%>
           <%
                 String id=(String)session.getAttribute("id");
                  PreparedStatement ps=con.prepareStatement("select * from employeeleave where id=? ORDER BY requestid DESC");
                  ps.setString(1,id);
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
        </tr>
          <% } %>
 </div>

 </div>

</body>
</html>
