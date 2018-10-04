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
<%  }%>
<div class="row mt-3">
    <div class="col-lg-6">
        <div class="card ml-3">
            <div class="card-header">Your Details</div>
            <div class="card-body">
                Name: <%= user.getName()%> 
                <hr>
                Email Address: <%= user.getEmail()%>
                <hr>
                Gender:  <%= user.getGender()%>                
            </div>



        </div>

    </div>
    <div class="col-lg-6">
        <div class="card mr-3">
            <div class="card-header">Your Purchase History</div>
            <div class="card-body"> 

                <!--SHOW HISTORY HERE-->
               
                <% String filePath = application.getRealPath("WEB-INF/history.xml");%>

                <jsp:useBean id="historyApp" class="uts.history.HistoryApplication" scope="application">
                    <jsp:setProperty name="historyApp" property="filePath" value="<%=filePath%>"/>
                </jsp:useBean>
                
                <%
                //we need to get the user here
                
                
                History history = historyApp.getHistory();
                //out.println("history: " + history);
                ArrayList<Order> orderList = new ArrayList();
                orderList = history.getMatchesForUser(user.getEmail()); //has to be changed for history.getMatchesForUser(user.getEmail()); when it's displaying
                //out.println("     orders: " + orderList);
                %>
                
                
                <c:set var = "xmltext"> 
                    <history>
                        <%  for (Order order : orderList) {%>
               
                        <Order>
                            <OrderID><%= order.getOrderID()%></OrderID>
                            <% for (Movie movie : order.getMovies()){ %>
                            <movie>
                                <Title><%= movie.getTitle()%></Title>
                                <Genre><%= movie.getGenre()%></Genre>
                                <ReleaseDate><%= movie.getDate()%></ReleaseDate>
                                <Price><%= movie.getPrice()%></Price>
                                <Copies><%= movie.getCopies()%></Copies>
                            </movie>
                            
                            <%}%>
                            <FullName><%= order.getFullName()%></FullName>
                            <Email><%= order.getEmail()%></Email>
                            <PaymentMethod><%= order.getPaymentMethod()%></PaymentMethod>
                            <TotalPrice><%= order.getTotalPrice()%></TotalPrice>
                            <OrderStatus><%= order.getOrderStatus()%></OrderStatus>
                            
                            
                        </Order>
                        <%}%>
                    </history>
                </c:set>
                <c:import url = "WEB-INF/history.xsl" var = "xslt"/>

                <x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>


            </div>
        </div>

    </div>

</div>

<div class="row mt-3">
    <div class="col-lg-6 ml-3">
        <a class="btn btn-primary text-white" href="editUser.jsp">Edit Account</a>
        <button type="button" class="btn btn-danger">Delete Account</button>
    </div> 
</div>
