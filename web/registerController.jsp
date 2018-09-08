<%@page import="uts.ass.models.*"%>
<%

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String agreeTOS = request.getParameter("tos");
    
    String filePath = application.getRealPath("WEB-INF/users.xml");
    
    MovieStore movieApp = new MovieStore();
    movieApp.setFilePath(filePath);
    Users users = movieApp.getUsers();
    
    User anotherUser = users.emailChecker(email);
    
    if (agreeTOS != null && anotherUser == null) {
        User user = new User(email, name, password, gender);
        session.setAttribute("registeredUser", user);
        users.addUser(user);
        
        movieApp.saveUsers(users, filePath);
        movieApp.updateXML();
        response.sendRedirect("index.jsp");  
    } else if (anotherUser != null) {
        response.sendRedirect("register.jsp?error=This Email Address is already Used");
    } else {
        response.sendRedirect("register.jsp?error=Please Agree TOS first!");
    }
%>