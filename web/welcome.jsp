<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
    </head>
    <body background="Movie_night.jpg">
        <%
            String email = request.getParameter("email");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String favmovies = request.getParameter("favmovies");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
        %>
        <h3>Hello! <%=fname%></h3>
        <h3>Your Email is <%=email%></h3>
        <h3>Your Password is <%=password%></h3>
        <h3>Your Date of Birth is <%=dob%></h3>
        <h3>Your Favourite movie is <%=favmovies%></h3>
    </body>
</html>
