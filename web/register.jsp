<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<%
    String error = (String) request.getParameter("error");
    String emailErr = (String) request.getParameter("emailError");
    String passErr = (String) request.getParameter("passwordError");
    String nameErr = (String) request.getParameter("nameError");
    String addressErr = (String)request.getParameter("addressErr");
%>

<div class="container">
    <div class="row mt-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    Register and Enjoy the superhit movies
                </div>
                <div class="card-body">
                    <h3 class="card-title">Register</h3>
                    <% if (error != null) { %>
                    <div class="alert alert-danger"><%out.print(error);%> </div>
                    <%  } %>
                    <form action="registerController.jsp" method="POST">
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <% if (emailErr != null) { %>
                            <div class="alert alert-danger"><%out.print(emailErr);%> </div>
                            <%  }%>
                            <input type="text" name="email" class="form-control" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <label for="name">Full Name</label>
                            <% if (nameErr != null) { %>
                            <div class="alert alert-danger"><%out.print(nameErr);%> </div>
                            <%  }%>
                            <input type="text" name="name" class="form-control" placeholder="Name">
                        </div> 
                        <div class="form-group">
                            <label for="password">Password</label>
                            <% if (passErr != null) { %>
                            <div class="alert alert-danger"><%out.print(passErr);%> </div>
                            <%  }%>
                            <input type="password" name="password" class="form-control" placeholder="Password">
                        </div>   
                            <div class="form-group">
                            <label for="address">Address</label>
                            <% if (addressErr != null) { %>
                            <div class="alert alert-danger"><%out.print(addressErr);%> </div>
                            <%  }%>
                            <input type="text"  name="address" class="form-control" placeholder="Address">
                        </div>   
                        <div class="form-group">
                            <label><input type="radio" name="gender" value="male" checked /><span>Male</span></label>
                            <label><input type="radio" name="gender" value="female" /><span>Female</span></label>
                        </div>
                        <div class="form-group">
                            <label><input type="checkbox" name="tos"/><span>Agree to TOS</span></label>
                        </div>
                        <button type="submit" class="btn btn-primary">Register</button>
                    </form>  
                </div>
                <div class="card-footer text-muted">
                    Already have an account? <a href="login.jsp">Login !</a>
                </div>
            </div>
        </div>
    </div>

</div>




<%@include file="footer.jsp" %>