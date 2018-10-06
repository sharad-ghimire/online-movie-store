<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<%
    session.setAttribute("firstTime", "false");
    User user = (User) session.getAttribute("loggedUser");
%>
<div class="container">
    <div class="jumbotron ">
        <div class="text-center">
            <img src="img/success.png" height="50" width="50">
            <h3>Congratulations!</h3>
            <p>You can enjoy the purchased movie now!</p>
            <p>Wanna Buy new movie?</p>
            <a class="btn btn-primary mb-3" href="index.jsp">Go Back</a>
            <% if(user == null){%>
            <p>or simply <a href="login.jsp">Login</a> or <a href="register.jsp">Register</a>.</p>
            <%}%>
        </div>
    </div>
</div>

     
        

            
            
            
<%@include file="footer.jsp" %>

