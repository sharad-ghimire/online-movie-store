<%@page import="java.util.ArrayList"%>
<%@page import="uts.movies.*"%>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>

<% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
<jsp:useBean id="moviesApp" class="uts.movies.MovieApplication" scope="application">
    <jsp:setProperty name="moviesApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%Movies movies = moviesApp.getMovies();
    String idOfMovie = (String) request.getParameter("id");
    
    Movie movie = movies.idChecker(idOfMovie);
    
    
    session.setAttribute("cartMovies", movie);
    ArrayList<Movie> cartMovies = (ArrayList<Movie>)session.getAttribute("cartMovies");
    
    cartMovies.add(movie);
    
//    session.setAttribute("cartMovies", cartMovies);//sets session value to ArrayList
  %>
    <body>
        <div class="container">
            
        
        <a class="btn btn-success text-white mt-5">Proceed to checkout</a>
        
       <div class="row mt-3">
        <div class="col-lg-12">
            <div class="card">
              <div class="card-header">
                Your Shooping Cart.
              </div>
              <div class="card-body">              
                    <div class="row">
                        <div class="col-lg-4">
                            Your Movie Name
                            
                        </div>
                        <div class="col-lg-2">
                            Item Price
                        </div>
                        <div class="col-lg-2">
                            Quantity
                        </div>
                        <div class="col-lg-2">
                            Total Price
                        </div>
                         <div class="col-lg-2">
                             
                        </div>
                        
                    </div>
                
                <div class="row mt-3">
                    <% for (Movie movie1 : cartMovies) { %>
                    
                       <div class="col-lg-4 mt-3">
                            <h6> <%=movie.getTitle() %></h6>
                            
                        </div>
                        <div class="col-lg-2 mt-3">
                            <%=movie.getPrice() %>
                        </div>
                        <div class="col-lg-2 mt-3">
                            <select>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>                               
                            </select>
                        </div>
                        <div class="col-lg-2 mt-3">
                        </div>
                         <div class="col-lg-2 mt-3">
                             <button class="btn btn-danger">Remove</button>
                           
                        </div>
                      <hr>	 
		<%}%>     
                    </div>
               
              </div>
            </div>   
                <a href="index.jsp" class="btn btn-success text-white mt-3">Continue Shopping</a>
        </div>
      
     </div>
    </body>
    <%@include file="script.jsp" %>
</html>
