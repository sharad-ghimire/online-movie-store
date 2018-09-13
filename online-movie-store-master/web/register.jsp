<%@include file="header.jsp" %>
        <%
            String error = (String) request.getParameter("error"); 
        %>
        <h1>Register</h1>
        <p><span style="color: red"><% if(error != null){ out.print(error);  } %></span></p>
        <form action="registerController.jsp" method="POST">
            <label for="email">Email</label>
            <input type="text" name="email">
            <label for="name">Full Name</label>
            <input type="text" name="name">
            <label for="password">Password</label>
            <input type="password" name="password">
            <label><input type="radio" name="gender" value="male" checked /><span>Male</span></label>
            <label><input type="radio" name="gender" value="female" /><span>Female</span></label>
            
            <label><input type="checkbox" name="tos"/><span>Agree to TOS</span></label>
            <button type="submit" class="btn teal">Register</button>
        </form>
    </body>
</html>