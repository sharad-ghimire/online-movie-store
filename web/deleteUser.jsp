<%@page import="uts.users.*"%>
<%@include file="header.jsp"%>
<%@include file="navbar.jsp" %>

<%String filePath = application.getRealPath("WEB-INF/users.xml");%>
<jsp:useBean id="usersApp" class="uts.users.UserApplication" scope="application">
    <jsp:setProperty name="usersApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%
    User user = (User) session.getAttribute("loggedUser");
    User anotherUser = (User) session.getAttribute("registeredUser");
    String name = user.getName();
    String email = user.getEmail();
    
    if (user == null && anotherUser == null) {
        response.sendRedirect("login.jsp?error=Please Login first!!");
    }  if(user!=null && anotherUser==null) {
         
    }%>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
        <li class="breadcrumb-item"><a href="profile.jsp">Profile</a></li>
        <li class="breadcrumb-item active" aria-current="page">Edit Page</li>
    </ol>
</nav>
<div class="text-center mt-3">
    <h4>Hi <%= user.getName()%></h4>
    <small class="text-center mt-2">Enter your email to delete your account.</small> 
</div>
<div class="card-header"> 
    Enter your email address and name.
</div>
<div class="card-body">
    <form action="index.jsp" method="post">
        <div class="form-group">
            <label for="email">Enter your email address</label>
            <input type="email" value="<%= user.getEmail()%>" name="email" class="form-control" placeholder="Email" >
        </div>
        <div class="form-group">
            <label for="name">Edit Full Name</label>
            <input type="text" value="<%= user.getName()%>" name="name" class="form-control" placeholder="Name" >
        </div>
        <button type="submit" class="btn btn-primary">Delete</button>
    </form>
</div>
<%
    if ((name.equalsIgnoreCase(user.getName())) && (email.equalsIgnoreCase(user.getEmail()))) {
        Users users = usersApp.getUsers();
        users.removeUser(user);
    }
    //if ((name.equalsIgnoreC ase(user.getName()) && (email.equalsIgnoreCase(user.getEmail())))) {
//        Users users = usersApp.getUsers();
//            if (users != null) {
//                users.removeUser(user);
//                
    //usersApp.updateXML();
    //}
%><%
   session.invalidate();
%>
<!--<h1><%=name%></h1>
<h1><%=email%></h1>-->

<!--<form action="editController.jsp" method="post">
    <div class="card">
        
        <div class="card-header">
            Edit details here.
        </div>
        <div class="card-body">
            <form action="registerController.jsp" method="POST">
                <div class="form-group">
                    <label for="email">Edit email address</label>
                    <input type="email" value="<%= user.getEmail()%>" name="email" class="form-control" placeholder="Email" >
                </div>
                <div class="form-group">
                    <label for="name">Edit Full Name</label>
                    <input type="text" value="<%= user.getName()%>" name="name" class="form-control" placeholder="Name" >
                </div> 
                <div class="form-group">
                    <label for="password">Edit Password</label>
                    <input type="text" value="<%= user.getPassword()%>" name="password" class="form-control" placeholder="Password" >
                </div>   
                
                <button type="submit" class="btn btn-primary">Save</button>
                
            </form>  

        </div>
    </div>
</form>-->

<!--<form action="index.jsp">
    <h1>Account deletion page.</h1>
    <div class="form-group">
        <label for="email">Email address</label>
        <input type="email" value="<%= user.getEmail()%>" name="email" class="form-control" placeholder="Email" >
    </div>
    <div class="form-group">
        <label for="name">Full Name</label>
        <input type="text" value="<%= user.getName()%>" name="name" class="form-control" placeholder="Name" >
    </div> 
    <div>
        <input type="radio" name="confirm" value="confirm"> Confirm  <br><br>
        <caption align="right"> This can't be undone. Are you sure. </caption>
    </div>
    <div>
        <input type="hidden" value="updated" name="updated"/>

        <button type="submit" name="delete" value="delete" class="btn btn-primary">
            Delete
        </button>
        &emsp;

        <button class="buttton" type="button" onclick="location.href = 'index.jsp'">Main Page</button>

</form>-->

<%

    //Users users = (Users) session.getAttribute("userEdit");
//    String confirm = request.getParameter("confirm");
//
//    
//    
// if (confirm!=null) {
//
//        String name = request.getParameter("name");
//        String email = request.getParameter("email");
//        if ((name.equalsIgnoreCase(user.getName())) && (email.equalsIgnoreCase(user.getEmail()))) {
//            Users users = usersApp.getUsers();
//            if (users != null) {
//                users.removeUser(user);
//                
//                usersApp.updateXML();
//                //usersApp.saveUsers(users, filePath);
//                session.invalidate();
//            }
//
//        }
//    }
%>
<%@include file="footer.jsp"%>