<%@page import="java.util.ArrayList"%>
<%@page import="uts.movies.Movie"%>
<%@page import="uts.users.*"%>
<% 
    String filePath = application.getRealPath("WEB-INF/users.xml");
    
    UserApplication userApp = (UserApplication) application.getAttribute("movieApp");
    if (userApp == null) {
        userApp = new UserApplication();
        userApp.setFilePath(filePath);
        application.setAttribute("userApp", userApp);    
    }
    
    Users users = userApp.getUsers();
    String email = request.getParameter("email");
    String password = request.getParameter("password");
 
    User user = users.login(email, password);    
    
    if(user != null){
        session.setAttribute("loggedUser", user);
        response.sendRedirect("profile.jsp?success=You are now logged in!");
    } else {
        response.sendRedirect("login.jsp?error=Incorrect Email or Password");
    } 
%>