<%@page import="uts.users.*"%>
<%@include file="header.jsp"%>
<%@include file="navbar.jsp" %>

<%String filePath = application.getRealPath("WEB-INF/users.xml");%>
<jsp:useBean id="usersApp" class="uts.users.UserApplication" scope="application">
    <jsp:setProperty name="usersApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%
    User user = (User) session.getAttribute("userEdit");
    //Users users = (Users) session.getAttribute("userEdit");
%>

<form action="index.jsp">
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
        <!--<caption align="right"> This can't be undone. Are you sure. </caption>-->
    </div>
    <div>
        <input type="hidden" value="updated" name="updated"/>

        <button type="submit" name="delete" value="delete" class="btn btn-primary">
            Delete
        </button>
        &emsp;

        <button class="buttton" type="button" onclick="location.href = 'index.jsp'">Main Page</button>

</form>

<%

    //Users users = (Users) session.getAttribute("userEdit");
    String confirm = request.getParameter("confirm");

    
    
 if (confirm!=null) {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        if ((name.equalsIgnoreCase(user.getName())) && (email.equalsIgnoreCase(user.getEmail()))) {
            Users users = usersApp.getUsers();
            if (users != null) {
                users.removeUser(user);
                
                usersApp.updateXML();
                //usersApp.saveUsers(users, filePath);
                session.invalidate();
            }

        }
    }
%>
<%@include file="footer.jsp"%>