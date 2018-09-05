<%-- 
    Document   : register
    Created on : 03/09/2018, 5:19:09 PM
    Author     : pramishluitel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register Page</title>
        <style> 
            table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
input[type=submit] {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 16px 32px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
}
</style>

    </head>
    
    <body background="Movie_night.jpg">
        
        <form action="main.jsp" method="post">
            <table>
                <caption>Registration</caption>
                <tr>
                <th>Email Address: </th>
                <th><input type="text" name ="email"></th>
                </tr>
            <br>
            <tr>
                <th>Full Name: </th>
                <th><input type="text" name ="name"></th>
            <br>
            </tr>
            <tr>
                <th>Password: </th>
                <th><input type="password" name ="password"></th>
            </tr>
            <br>                
            <tr>
                <th>Phone Number: </th>
                <th><input type="text" name ="phone"></th>
            </tr>
            <tr>
                <th> Address </th>
                <th><input type="address" name ="address"></th>
            </tr>
            <br>
            <tr>
                <th></th>
                <th><input type="submit" Value ="Register" name="register"></th>
            </tr>
            <br>
        </table>
        </form>
    </body>
</html>
