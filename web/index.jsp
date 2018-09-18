<%@page import="java.util.*"%>
<%@page import="uts.users.User"%>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>

<!--<div class="jumbotron text-center">
        <h1 class="display-4">Welcome to Online Movie Store</h1>
        <p class="lead">This is the simple place where you can get all the superhit movies and series.</p>
        <hr class="my-4">
        <p>You can browse around and look at our collections by searching below or simply register/login to enjoy our service.</p>
        <a class="btn btn-primary btn-lg" href="login.jsp" role="button">Login </a>
        <a class="btn btn-primary btn-lg" href="register.jsp" role="button">Register </a>
</div>-->




<div class="container text-center">
    <div class="row mt-3">
        <div class="col-lg-12">
            <div class="card">
              <div class="card-header">Start with searching our collection</div>
              <div class="card-body">
                <form method="POST" action="searchController.jsp">
                        <label for="title"> Search By Title</label>
                        <input class="form-control ml-3" name="title" type="text" placeholder="Enter Title . . . ">

                        <label for="genre"> Search By Genre</label>
                        <input class="form-control ml-3" name="genre" type="text" placeholder="Enter Genre . . . ">


                        <label for="genre"> Search By Date Range</label>    
                        <div class="row">
                            <div class="col-lg-6">
                                 <div class="input-group">
                                    <span class="input-group-addon">From</span>
                                     <input type="date" class="form-control" name="fromDate">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <span class="input-group-addon">To</span>
                                     <input type="date" class="form-control" name="toDate">
                                </div>  
                            </div>
                        </div>

                        <button class="btn btn-primary mt-2" type="submit">Search</button>
                    </form>
              </div>
            </div>
            
        </div>
    </div>
</div>











<%@include file="footer.jsp" %>
