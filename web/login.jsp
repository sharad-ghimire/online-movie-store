<%-- 
    Document   : login
    Created on : 08/09/2018, 7:13:16 PM
    Author     : srd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<% String error = (String) request.getParameter("error");
    User user = (User) session.getAttribute("loggedUser");
    if(user != null){
        response.sendRedirect("profile.jsp");
    }
%>
<div class="container">

    <div class="row mt-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    Login and Enjoy the movies
                </div>
                <div class="card-body">
                    <h3 class="card-title">Log In</h3>
                    <% if(error != null){ %>
                    <div class="alert alert-danger"><%out.print(error);%> </div>
                    <%  } %>
                    <form action="loginController.jsp" method="POST">
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" name="email" class="form-control" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-primary">Log In</button>
                    </form>  
                </div>
                <div class="card-footer text-muted">
                    Don't have an account? <a href="register.jsp">Create here ! </a>
                </div>
            </div>

        </div>

    </div>
</div>







<%@include file="footer.jsp" %>