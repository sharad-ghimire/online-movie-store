<%-- 
    Document   : index
    Created on : 08/09/2018, 5:17:37 PM
    Author     : srd
--%>

<%@page import="java.util.Date"%>
<%@page import="uts.ass.models.User"%>
<%@include file="header.jsp" %>

<%
    User loggedUser = (User) session.getAttribute("loggedUser");
    User registeredUser = (User) session.getAttribute("registeredUser");
            
    if (loggedUser != null && registeredUser == null){%>
       <p>You are logged in as <%= loggedUser.getName()%></p>
       <p><a href="logoutController.jsp">Logout</a> | <a href="editUser.jsp">My Account</a></p>
       <%@include file="searchItem.jsp" %>
    <% } else { 
        System.out.print(new Date().toString()); %>     
        
        <p>You are not logged in</p>
        <p><a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></p>
        <%@include file="searchItem.jsp" %>
    <% }%>
</body>
</html>
