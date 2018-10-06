<%-- 
    Document   : showHistory
    Created on : 04-oct-2018, 19:31:20
    Author     : joanc
--%>
<%@page import="uts.users.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.history.History"%>
<%@page import="uts.movies.Movie"%>
<%@page import="uts.history.Order"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<% String filePath = application.getRealPath("WEB-INF/history.xml");%>
<jsp:useBean id="historyApp" class="uts.history.HistoryApplication" scope="application">
    <jsp:setProperty name="historyApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%
    //we need to get the user here
    User usera = (User) session.getAttribute("loggedUser");
    History history = historyApp.getHistory();
//    out.println("history: " + history);
    ArrayList<Order> orderList = new ArrayList();
    orderList = history.getMatchesForUser(usera.getEmail());
    
    System.out.print("Order List "+ orderList);
    //has to be changed for history.getMatchesForUser(user.getEmail()); when it's displaying
//    out.println("orders:" + orderList);
%>
<c:set var = "xmltext"> 
    <history>
        <%  for (Order order : orderList) {%>
        <order>
            <orderId><%= order.getOrderId()%></orderId>
            <orderDate><%= order.getOrderDate()%></orderDate>
                <% for (Movie movie : order.getMovies()) {%>
            <movie>
                <id><%= movie.getId()%></id>
                <title><%= movie.getTitle()%></title>
                <genre><%= movie.getGenre()%></genre>
                <date><%= movie.getDate()%></date>
                <price><%= movie.getPrice()%></price>
                <copies><%= movie.getCopies()%></copies>
                <status><%= movie.getStatus()%></status>
                <img><%= movie.getImg()%></img>
                <img><%= movie.getDetails()%></img>
            </movie>
            <%}%>
            
            <name><%= order.getName()%></name>
            <email><%= order.getEmail()%></email>
            <paymentMethod><%= order.getPaymentMethod()%></paymentMethod>
            <totalPrice><%= order.getTotalPrice()%></totalPrice>
            <orderStatus><%= order.getOrderStatus()%></orderStatus>
        </order>
        <%}%>
    </history>
</c:set>
<c:import url = "WEB-INF/history.xsl" var = "xslt"/>

<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>