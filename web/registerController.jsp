<%@page import="uts.controller.Validator"%>
<%@page import="uts.users.*"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String agreeTOS = request.getParameter("tos");
    String address = request.getParameter("address");

    String filePath = application.getRealPath("WEB-INF/users.xml");

    UserApplication userApp = new UserApplication();
    userApp.setFilePath(filePath);
    Users users = userApp.getUsers();
    Validator v = new Validator();
    User anotherUser = users.emailChecker(email);
    if (agreeTOS == null) {
        response.sendRedirect("register.jsp?error=Please Agree TOS first!");
    } else if (!v.validateEmail(email)) {
        response.sendRedirect("register.jsp?emailError=This Email format is incorrect");
    } else if (!v.validateName(name)) {
        response.sendRedirect("register.jsp?nameError=This name format is incorrect");
    } else if (!v.validatePassword(password)) {
        response.sendRedirect("register.jsp?passwordError=This password format is incorrect.");
    } else if (anotherUser != null) {
        response.sendRedirect("register.jsp?nameerror=This Email Address is already Used");
    }
    else if (agreeTOS != null && anotherUser == null) {
        User user = new User(email, name, password, gender,address);
        session.setAttribute("loggedUser", user);
        users.addUser(user);
        userApp.saveUsers(users, filePath);
        userApp.updateXML();
        session.setAttribute("firstTime", "true");
        response.sendRedirect("profile.jsp?success=Registration Sucessful");  
    }
//    
//    
//    if (agreeTOS != null && anotherUser == null) {
//        User user = new User(email, name, password, gender);
//        session.setAttribute("loggedUser", user);
//        users.addUser(user);
//        userApp.saveUsers(users, filePath);
//        userApp.updateXML();
//        session.setAttribute("firstTime", "true");
//        response.sendRedirect("profile.jsp?success=Registration Sucessful");  
//    } else if (anotherUser != null) {
//        response.sendRedirect("register.jsp?error=This Email Address is already Used");
//    } else {
//        response.sendRedirect("register.jsp?error=Please Agree TOS first!");
//    }
%>