<%@page import="uts.users.*"%>
<%@include file="header.jsp"%>
<%@include file="navbar.jsp" %>
<%String filePath = application.getRealPath("WEB-INF/users.xml");%>
<jsp:useBean id="usersApp" class="uts.users.UserApplication" scope="application">
    <jsp:setProperty name="usersApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%
//    User user = (User) session.getAttribute("userEdit");
    User user = (User) session.getAttribute("loggedUser");
    
%>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
        <li class="breadcrumb-item"><a href="profile.jsp">Profile</a></li>
        <li class="breadcrumb-item active" aria-current="page">Edit Page</li>
    </ol>
</nav>
<div class="text-center mt-3">
   <h4>Hi <%= user.getName()%></h4>
    <small class="text-center mt-2">Keep your Account Up To date</small> 
</div>
    
<form action="editController.jsp" method="post">
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
</form>
<%@include file="footer.jsp"%>