<%@page import="uts.controller.Validator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.movies.Movie"%>
<%@page import="uts.users.*"%>
<%
    String filePath = application.getRealPath("WEB-INF/users.xml");

    UserApplication userApp = (UserApplication) application.getAttribute("userApp");
    if (userApp == null) {
        userApp = new UserApplication();
        userApp.setFilePath(filePath);
        application.setAttribute("userApp", userApp);
    }

    Users users = userApp.getUsers();
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Validator v = new Validator();

    User user = users.login(email, password);
    if (!v.validateEmail(email)) {
        response.sendRedirect("login.jsp?emailError=Incorrect Email Format");
    }
    else if (!v.validatePassword(password)) {
        response.sendRedirect("login.jsp?passError=Incorrect Password Format");
    }
    else if (user == null) {
        response.sendRedirect("login.jsp?error=No such User.");
    } else{
        session.setAttribute("loggedUser", user);
        response.sendRedirect("profile.jsp?success=You are now logged in!");
    }
%>