<% 
    String searchParam = request.getParameter("search");
%>
<%@include file="index.jsp"%>
<h1><%= searchParam %></h1>

<!--TODO-->
<!--If Search Parameter not found -->
<%@include file="404.jsp" %>

<!--Else Show them-->
