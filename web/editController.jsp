<%@page import="uts.users.UserApplication"%>
<%@page import="uts.users.Users"%>
<%@page import="uts.users.User"%>
<%   
    User user = (User) session.getAttribute("loggedUser");    
    user.updateDetails(request.getParameter("email"), request.getParameter("name"), request.getParameter("password"));
    response.sendRedirect("profile.jsp?success=Details Updated successfully");
%>