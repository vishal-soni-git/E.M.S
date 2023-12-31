<%@ page language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
    body{
        background-color: #7284f3;
    }
    .error--gif{
     background-color: #7284f3;
     padding: 20px;
    }
        .error--gif img{
          height:400px;
          width:500px;
        }
    </style>
</head>
<body>
<center>
<div class='error--gif'>
<img src="./images/error.gif" alt="GIF Image">
<div>
    <div class="error-container">
        <h1>Error Encountered</h1>
        <p>Oops! Something went wrong.</p>
        <p>Error Details:</p>
        <p><%= exception %></p> <!-- This will display the exception message -->
        <div class="footer">
            <p>&copy; 2023 ems.com</p>
        </div>
    </div>
    </center>
</body>
</html>
