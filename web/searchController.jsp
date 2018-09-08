 
<%@page contentType="application/xml"%>
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="xsl/movies.xsl"?>  

<movies>
 <%  for (Movie book: listOfMovies) {   %>
   <movie>
     <title><%= book.getTitle()%></title>
     <genre><%= book.getGenre()%></genre>
     <number><%= book.getNumber()%></number>
     <rating><%= book.getRating()%></rating>
     <status><%= book.getStatus()%></status>
   </movie>
 <%}%>
</movies>

    

%>









%>