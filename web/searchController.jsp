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
    ArrayList<Movie> movieList = new ArrayList(); 
    movieList = movies.getMatchesForGenre(genre);
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
<c:import url = "file:\\C:\\Home\\JSP-projects\\movie-store\\web\\WEB-INF\\movies.xsl" var = "xslt"/>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>