<%-- 
    Document   : login
    Created on : 08/09/2018, 7:13:16 PM
    Author     : srd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<% String error = (String) request.getParameter("error"); %>
        <h1> Log In</h1>
        <p><span style="color: red"><% if(error != null){ out.print(error);  } %></span></p>
        <form action="loginController.jsp" method="POST">
            <label for="email">Email</label>
            <input type="text" name="email">
            <label for="password">Password</label>
            <input type="password" name="password">
            <button type="submit" class="btn">Log In</button> 
        </form>
    </body>
</html>
