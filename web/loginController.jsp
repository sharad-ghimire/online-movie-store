<%@page import="uts.ass.models.*"%>
<% 
    String filePath = application.getRealPath("WEB-INF/users.xml");
    
    MovieStore movieApp = (MovieStore) application.getAttribute("movieApp");
    if (movieApp == null) {
        movieApp = new MovieStore();
        movieApp.setFilePath(filePath);
        application.setAttribute("movieApp", movieApp);    
    }
    
    Users users = movieApp.getUsers();
    String email = request.getParameter("email");
    String password = request.getParameter("password");
 
    User user = users.login(email, password);
        
    
    if(user != null){
        session.setAttribute("loggedUser", user);
        response.sendRedirect("index.jsp"); 
    } else {
        response.sendRedirect("login.jsp?error=Incorrect Email or Password");
    } 
%>