<%@page import="uts.users.User"%>
<%
    User loggedUser = (User) session.getAttribute("loggedUser");
    User registeredUser = (User) session.getAttribute("registeredUser");%>
<!--Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">Online Movie Store</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="index.jsp">Home </a>
            </li>
            
            <% if(loggedUser != null&& registeredUser==null) { %> 
            
            <li class="nav-item">
              <a class="nav-link" href="editUser.jsp">View Profile</a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link" href="logoutController.jsp">Logout</a>
            </li>
            
            <li class="nav-item"><a class="nav-link" href="editUser.jsp"><%= loggedUser.getName()%></a></li>
            
            <% } else if (registeredUser != null) {%>
            <li class="nav-item">
              <a class="nav-link" href="editUser.jsp">View Profile</a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link" href="logoutController.jsp">Logout</a>
            </li>
            
            <li class="nav-item"><a class="nav-link" href="editUser.jsp"><%= registeredUser.getName()%></a></li>
            
            <%} else { %>
            <li class="nav-item">
              <a class="nav-link" href="login.jsp">Login</a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link" href="register.jsp">Register</a>
            </li>
            
            <%}%>
            
            
          </ul>
        </div>
      </div>
    </nav>
