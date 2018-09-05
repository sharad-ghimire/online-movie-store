
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        marquee{
            width:100%;
            background-color: #ffcccc
        }
    </style>
    <marquee direction="scroll"> This is a online Movie Booking page.</marquee>
    <body background="Movie_night.jpg">
    
        <table>
            <tr>
                <th><h1 style="background-color:yellowgreen;">Online Movie Store</h1></th>
            </tr>
            <tr>
                <th><h3 style="background-color:greenyellow;"><a href="login.jsp">Login</a></h3></th>
            </tr>
            <tr>
                <th><h3 style="background-color:yellowgreen;"><a href="register.jsp">Register</a></h3></th>
            </tr>
            <tr>
                <th><input type="text" placeholder="Search.." name="search"></th>
                <th><input type="button" name="Search" value="search"</th>
            </tr>
        </table>           
        
    </body>
</html>
