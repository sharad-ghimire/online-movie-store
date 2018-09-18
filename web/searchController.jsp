<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="uts.movies.*" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
<jsp:useBean id="moviesApp" class="uts.movies.MovieApplication" scope="application">
    <jsp:setProperty name="moviesApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%Movies movies = moviesApp.getMovies();%>
<% 
    String genre = request.getParameter("genre");
    String title = request.getParameter("title");
    String fromDate = request.getParameter("fromDate");
    String toDate = request.getParameter("toDate");
    
    ArrayList<Movie> movieList = new ArrayList();
    
    if(genre != null && !genre.equals("")){
        movieList = movies.getMatchesForGenre(genre);
        if(movieList == null) {
            response.sendRedirect("404.jsp");
        }
    } else if (title != null && !title.equals("")){
        movieList = movies.getMatchesForTitle(title); 
        if(movieList == null) { 
            response.sendRedirect("404.jsp");
        }
    } else if(fromDate != null && !fromDate.equals("") || toDate != null && !toDate.equals("")){
        movieList = movies.getMatchesForDate(fromDate, toDate);
        if(movieList == null) {
            response.sendRedirect("404.jsp");
        }
    } else {
        response.sendRedirect("404.jsp");
    }
%>
<c:set var = "xmltext"> 
    <movies>
    <%  for (Movie movie: movieList) {   %>
      <movie>
        <title> <%= movie.getTitle()%> </title>
        <genre> <%= movie.getGenre()%> </genre>
        <date> <%= movie.getDate()%> </date>
        <price> <%= movie.getPrice()%> </price>
        <copies><%= movie.getCopies()%></copies>
        <status><%= movie.getStatus()%></status>
      </movie>
    <%}%>
  </movies>
</c:set>
<%--<c:import url = "file:\\Users\\pramishluitel\\Desktop\\UTS \\Fifth Semester\\Web Services Development\\Assignment Files\\online-movie-store\\web\\WEB-INF\\movies.xsl" var = "xslt"/>--%>
<c:import url = "file:\\C:\\Home\\JSP-projects\\movie-store\\web\\WEB-INF\\movies.xsl" var = "xslt"/>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Search</li>
  </ol>
</nav>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>
<%@include file="footer.jsp" %>
