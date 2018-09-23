<%@page import="uts.users.*"%>
<%@include file="header.jsp"%>
<%@include file="navbar.jsp" %>
<%String filePath = application.getRealPath("WEB-INF/users.xml");%>
<jsp:useBean id="usersApp" class="uts.users.UserApplication" scope="application">
    <jsp:setProperty name="usersApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%
    User user = (User) session.getAttribute("userEdit");
%>
<h1>My Account Page.</h1>
<form action="saveUser.jsp" method="post">
    <div class="card-body">
        <h3 class="card-title">Register</h3>

        <form action="registerController.jsp" method="POST">
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" value="<%= user.getEmail()%>" name="email" class="form-control" placeholder="Email" >
            </div>
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" value="<%= user.getName()%>" name="name" class="form-control" placeholder="Name" >
            </div> 
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" value="<%= user.getPassword()%>" name="password" class="form-control" placeholder="Password" >
            </div>   
            <input type="hidden" value="updated" name="updated"/>
            <button type="submit" class="btn btn-primary">Save</button>
            &emsp;
            <button class="buttton" type="button" onclick="location.href = 'index.jsp'">Main Page</button>
        </form>  
    </div>
</form>
<%    if (request.getParameter("updated") != null) {
        user.updateDetails(request.getParameter("email"), request.getParameter("name"), request.getParameter("password"));
        Users users = usersApp.getUsers();
        if (users != null) {
            users.updateList(user);
            usersApp.updateXML();
            session.setAttribute("user", user);
        }
        else{%><p class="outline">Could not Update users details!</p><%}
        
%><p class="outline">Users details has been updated.</p><%
    }
%>
<%@include file="footer.jsp"%>