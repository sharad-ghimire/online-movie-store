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
                User user = (User) session.getAttribute("loggedUser");
                
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