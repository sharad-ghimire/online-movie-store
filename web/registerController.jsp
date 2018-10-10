<%@page import="uts.users.*"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String agreeTOS = request.getParameter("tos");
    
    String filePath = application.getRealPath("WEB-INF/users.xml");
    
    UserApplication userApp = new UserApplication();
    userApp.setFilePath(filePath);
    Users users = userApp.getUsers();
    
    User anotherUser = users.emailChecker(email);
    
    if (agreeTOS != null && anotherUser == null) {
        User user = new User(email, password, name, gender);
        session.setAttribute("loggedUser", user);
        users.addUser(user);
        userApp.saveUsers(users, filePath);
        userApp.updateXML();
        session.setAttribute("firstTime", "true");
        response.sendRedirect("profile.jsp?success=Registration Sucessful");  
    } else if (anotherUser != null) {
        response.sendRedirect("register.jsp?error=This Email Address is already Used");
    } else {
        response.sendRedirect("register.jsp?error=Please Agree TOS first!");
    }
%>