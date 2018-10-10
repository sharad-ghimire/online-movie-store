<%@page import="uts.controller.Validator"%>
<%@page import="uts.movies.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<%
    User user = (User) session.getAttribute("loggedUser");
    ArrayList<Movie> cartMovies = (ArrayList<Movie>) session.getAttribute("cartMovies");
    String addressErr = (String) request.getParameter("addressErr");
    
    Validator v = new Validator();
    double totalPrice = 0.0;

    for (Movie movie : cartMovies) {
        totalPrice = totalPrice + movie.getPrice() * movie.getCopies();
    }
%>

<div class="container">

    <%if (user == null) {%>

    <div class="row mt-3">
        <div class="col text-center">
            <h3>Already a Memeber of OMS?</h3>
            <p>Please <a href="login.jsp">Login</a> or <a href="register.jsp">Register</a> for more features and discounts!</p>
        </div>
    </div>
    <%}%>
    <form action="purchaseController.jsp" method="post">
        <div class="row ">
            <div class="col-lg-10 ">
                <div class="card mt-3">
                    <div class="card-body "> 
                        <div class="row ml-3">
                            <div class="col-lg-6">
                                <div class="card mr-3">
                                    <div class="card-header">Payment Information </div>

                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <label id="name">Name</label>
                                                <input name="name" type="text" id="name" class="form-control" <%if (user != null) {%>value="<%= user.getName()%>" <%}%>> 
                                            </div>
                                            <div class="col-lg-6">
                                                <label id="address">Address</label>
                                                
                                                <input name="address" type="text" id="address" class="form-control" <%if (user != null) {%>value="<%= user.getAddress()%>" <%}%>> 
                                                <% if (addressErr != null) { %>
                                                <div class="alert alert-danger"><%out.print(addressErr);%> </div>
                                                <%  } %>
                                            </div>

                                        </div>

                                        <div class="row mb-3">
                                            <div class="col">
                                                <label id="email">Email</label>
                                                <input name="email" type="text" id="email" class="form-control" <%if (user != null) {%>value="<%= user.getEmail()%>" <%}%> > 
                                            </div>

                                        </div>
                                        <small class="text-muted">This is the secured SSL Encrypted Payment!</small>
                                        <label id="payment">Payment Method</label>
                                        <select  name="payment" class="form-control">
                                            <option value="Visa">Visa</option>
                                            <option value="Paypal">Paypal</option>
                                            <option value="CreditCard">Credit Card</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mr-3">
                                    <div class="card-header">Order Summary</div>
                                    <div class="card-body "> 
                                        <div class="text-right">
                                            <p><b>Total: </b>$<%= totalPrice%></p>
                                            <p><b>Shipping: </b><i>FREE</i></p>
                                            <small>Shipping will always be free.</small>
                                            <hr>
                                            <p>Subtotal: $<%= totalPrice%></p>
                                        </div>
                                        <div class="text-center">
                                            <button type="submit" class="btn btn-success btn-block">Purchase</button><br>
                                            <small>Your transaction will be <span class="text-primary">safe and secure.</span></small>
                                        </div>
                                    </div>
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>

</div>
<%@include file="footer.jsp" %>