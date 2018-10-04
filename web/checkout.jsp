<%@page import="java.util.ArrayList"%>
<%@page import="uts.movies.*"%>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>

<% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
<jsp:useBean id="moviesApp" class="uts.movies.MovieApplication" scope="application">
    <jsp:setProperty name="moviesApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%Movies movies = moviesApp.getMovies();

    String idOfMovie = request.getParameter("id");
    String deleteMovie = request.getParameter("deleteId");
    
    Movie movie = movies.idChecker(idOfMovie);
    Movie movieToDelete = movies.idChecker(deleteMovie);
    
    
    
    ArrayList<Movie> cartMovies = (ArrayList<Movie>) session.getAttribute("cartMovies");
   
    
    if(movieToDelete != null)
    {
        if(cartMovies.contains(movieToDelete))
        {
            cartMovies.remove(movieToDelete);
            session.setAttribute("cartMovies", cartMovies);
        }
        
    }
    
    if((cartMovies == null)){
        ArrayList<Movie> cart = new ArrayList<Movie>();
        //cart.add(movie);
        session.setAttribute("cartMovies", cart);
        cartMovies = cart;
    } else {
        //cartMovies.add(movie);
    }
    
    if(movie!=null)
    {
        cartMovies.add(movie);
    }
    
    //code to delete the selected movie
    //saving it to the session again
    
System.out.print(cartMovies);  %>
    <body>
        <div class="container">
            <a class="btn btn-success text-white mt-5" href="purchase.jsp">Proceed to checkout</a>
       <div class="row mt-3">
        <div class="col-lg-12">
            <div class="card">
              <div class="card-header">
                Your Shopping Cart.
              </div>
              <div class="card-body">              
                    <div class="row">
                        <div class="col-lg-6"><h4>Your Movie Name</h4></div>
                        <div class="col-lg-3"><h4>Item Price</h4></div>
                         <div class="col-lg-3"></div> 
                    </div>
                
                
                <% for (Movie movie1 : cartMovies) { %>
                    <div class="row">
                       <div class="col-lg-6 mt-3"><h6> <%=movie1.getTitle() %></h6></div>
                       <div class="col-lg-3 mt-3"><%=movie1.getPrice() %></div>
                       <div class="col-lg-3 mt-3"><a class="btn btn-danger" href="checkout.jsp?deleteId=<%=movie1.getId()%>">Remove</a></div> 
                    </div>
                    <hr>           
		<%}%>

            </div> 
            <div class="card-footer">Estimated total: <%=20%></div>
            </div>
            
                <a href="index.jsp" class="btn btn-success text-white mt-3">Continue Shopping</a>
                <div class="row">
     </div>
    </body>
    <%@include file="script.jsp" %>
</html>
