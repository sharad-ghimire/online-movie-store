<%@page import="uts.history.Order"%>
<%@page import="uts.movies.MovieApplication"%>
<%@page import="uts.users.User"%>
<%@page import="uts.history.HistoryApplication"%>
<%@page import="uts.history.History"%>
<%@page import="uts.movies.Movie"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Movie> cartMovies = (ArrayList<Movie>) session.getAttribute("cartMovies");
//    User user = (User) session.getAttribute("loggedUser");
    String filePath = application.getRealPath("WEB-INF/history.xml");
    
    String paymentMethod = (String)request.getParameter("payment");
    String name = (String)request.getParameter("name");
    String email = (String)request.getParameter("email");
    
    if(name == null || name.isEmpty())
    {
        name = "Anonymous";
    }
    
    if(email == null || email.isEmpty())
    {
        email = "Anonymous";
    }
    
    System.out.print(email);
    ArrayList<Movie> cartMovie = (ArrayList<Movie>) session.getAttribute("cartMovies");
    double totalPrice = 0.0;

    for (Movie movie : cartMovie) {
        totalPrice = totalPrice + movie.getPrice();
    }
    String orderStatus = "Submitted";
    HistoryApplication historyApp = (HistoryApplication) application.getAttribute("historyApp");
    if (historyApp == null) {
        historyApp = new HistoryApplication();
        historyApp.setFilePath(filePath);
        application.setAttribute("historyApp", historyApp);    
    }
    
    History history = historyApp.getHistory();
    
    Order order = new Order();
    order = history.reserveMovie(cartMovies,name,email, paymentMethod, totalPrice, orderStatus);
   
    historyApp.saveHistory();
    
    
    //decrement number of copies
    String filePathMovies = application.getRealPath("WEB-INF/movies.xml");
    MovieApplication movieApp = (MovieApplication) application.getAttribute("movieApp");
    if (movieApp == null) {
        movieApp = new MovieApplication();
        movieApp.setFilePath(filePathMovies);
        application.setAttribute("movieApp", movieApp);    
    }
    
    movieApp.decrementCopies(order);
    
    //empty the cart after buying
    ArrayList<Movie> emptyCart = new ArrayList<Movie>();
    
    session.setAttribute("cartMovies", emptyCart);
    
    response.sendRedirect("success.jsp");
%>
