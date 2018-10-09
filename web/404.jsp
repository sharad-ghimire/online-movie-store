<%@page import="java.util.*"%>
<%@page import="uts.users.User"%>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Search</li>
  </ol>
</nav>
<div class="jumbotron text-center">
        <h3 class="display-1"><i class="fa fa-frown-o fa-2x" aria-hidden="true"></i> </h3>
        <p class="lead"><b>404:</b> The Movie item you are looking for is not here !</p>
        <hr>
        <a class="btn btn-primary " href="index.jsp" role="button">Go Back</a>
</div>

<%@include file="footer.jsp" %>
   