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
    
    System.out.print(email);
    ArrayList<Movie> cartMovie = (ArrayList<Movie>) session.getAttribute("cartMovies");
    double totalPrice = 0.0;

    for (Movie movie : cartMovie) {
        totalPrice = totalPrice + movie.getPrice();
    }
    String orderStatus = "Success";
    HistoryApplication historyApp = (HistoryApplication) application.getAttribute("historyApp");
    if (historyApp == null) {
        historyApp = new HistoryApplication();
        historyApp.setFilePath(filePath);
        application.setAttribute("historyApp", historyApp);    
    }
    
    History history = historyApp.getHistory();
    
    history.reserveMovie(cartMovies,name,email, paymentMethod, totalPrice, orderStatus);
   
    historyApp.saveHistory();
    response.sendRedirect("success.jsp");
%>
