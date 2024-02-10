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
                <h1>Updates</h1>
            </div>
            <div class="user--info">
                <img src="./images/emp.jpg" alt="">
            </div>
        </div>

        <div class='content--header'>Upload Updates</div>


        <div>
             <div class="attendece--content">
              <form action="uploadpost" method="post" enctype="multipart/form-data">
                 Upload Post:  <input type="file" name="post" id="file" required>
                 Title: <input type="text" name="title">
                 <Button >Upload</Button>
              </form>
             </div>
             <div class="updated-post-main">
                 <div class='updated-post'>
                 <!--jsp code for getting posts.-->
                         <%@ page errorPage="error.jsp" %>
                         <%@ include file="connection.jsp"%>
                     <%
                          String id=(String)session.getAttribute("id");
                           PreparedStatement ps=con.prepareStatement("select * from uploadpost  ORDER BY id DESC LIMIT 50 ");
                           ResultSet rs=ps.executeQuery();//get data in result set
                                while(rs.next())
                                {
                                    String title=rs.getString(2);
                                byte[] imageData = rs.getBytes(3);
                                java.util.Date date=(java.util.Date)rs.getDate(4);

                     // Convert byte array to base64 string
                     String base64Image = java.util.Base64.getEncoder().encodeToString(imageData);
                     %>
                    <p> <%=title%></p>
                    <p><%=date%></p>
                     <img src="data:image/jpeg;base64, <%= base64Image %>" alt="Database Image">
                     <br><br>
                       <% } %>
                       <!--jsp code end.-->
                 </div>
             </div>
        </div>
    </div>
</body>
</html>
