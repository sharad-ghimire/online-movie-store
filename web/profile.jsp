<%@page import="java.util.ArrayList"%>
<%@page import="uts.history.Order"%>
<%@page import="uts.history.History"%>
<%@page import="uts.movies.Movies"%>
<%@page import="uts.movies.Movie"%>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%
    String success = (String) request.getParameter("success");

    String firstTime = (String) session.getAttribute("firstTime");
    User user = (User) session.getAttribute("loggedUser");
    User anotherUser = (User) session.getAttribute("registeredUser");

    if ((user == null && anotherUser == null)) {
        response.sendRedirect("login.jsp?error=Please Login first!!");
    }
%>
<%if (success != null) { %>
<div class="alert alert-success">
    <%out.print(success);%> 
</div>
<%  }
%>
<div class="row mt-3 mb-3">
    <div class="col-lg-12 text-center ">
        <a class="btn btn-primary text-white" href="editUser.jsp">Edit Account</a>
        <a class="btn btn-danger" href="deleteUser.jsp" >Delete Account</a>
    </div>
</div>

<div class="row">
    <div class="col-lg-1"></div>
    <div class="col-lg-10">
        <div class="card ml-3 mr-3">
            <div class="card-header">Your Purchase History</div>
            <div class="card-body"> 
                <%if (firstTime == null || firstTime.equals("true")) {%>
                <div class="text-center">
                    <p>No Purchase History!<p>
                    <p>Purchase something by searching from <a href="index.jsp">here<a>.</p>
                                </div>
                                <%} else {%>
                                <!--SHOW HISTORY HERE-->
                                <div class="container">
                                    <table class="table  table-bordered table-hover">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Order ID</th>
                                                <th scope="col">Date</th>
                                                <th scope="col">Movies</th>
                                                <th scope="col">Cancel</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%@include file="showHistory.jsp" %>

                                        </tbody>
                                    </table>
                                </div>
                                <%}%>
                                </div>
                                </div>
                                </div>
                                <div class="col-lg-1"></div>
                                </div>

