<%@page import="uts.controller.Validator"%>
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
    Validator v = new Validator();

    if (!genre.isEmpty()) {
        movieList = movies.getMatchesForGenre(genre);

        if (movieList.isEmpty()) {
            response.sendRedirect("404.jsp");
        }
    } else if (!title.isEmpty()) {
        movieList = movies.getMatchesForTitle(title);
        if (movieList.isEmpty()) {
            response.sendRedirect("404.jsp");
        }
    } else if (!fromDate.isEmpty() || !toDate.isEmpty()) {
        movieList = movies.getMatchesForDate(fromDate, toDate);
        if (movieList.isEmpty()) {
            response.sendRedirect("404.jsp");
        }
    } else if (v.validateYearsPattern(fromDate)) {
        response.sendRedirect("searchController.jsp?yearError=Date Format is incorrect.");
    }
    
    else if (v.validateYearsPattern(toDate)) {
        response.sendRedirect("searchController.jsp?yearError=Date Format is incorrect.");
    }
    
    else {
        response.sendRedirect("404.jsp");
    }
%>
<c:set var = "xmltext"> 
    <movies>
        <%  for (Movie movie : movieList) {%>
        <movie>
            <id><%= movie.getId()%></id>
            <title> <%= movie.getTitle()%> </title>
            <genre> <%= movie.getGenre()%> </genre>
            <date> <%= movie.getDate()%> </date>
            <price> <%= movie.getPrice()%> </price>
            <copies><%= movie.getCopies()%></copies>
            <status><%= movie.getStatus()%></status>
            <img><%=movie.getImg()%></img>
            <details><%=movie.getDetails()%></details>
        </movie>
        <%}%>
    </movies>
</c:set>
<c:import url = "WEB-INF/movies.xsl" var = "xslt"/>

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
