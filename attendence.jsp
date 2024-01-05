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
            <h2>Attendence</h2>
        </div>
        <div class="user--info">
            <img src= "./images/emp.jpg" alt="">
        </div>
    </div>

 <div class='content--header'>MARKING ATTENDANCE </div>


 </div>

</body>
</html>
