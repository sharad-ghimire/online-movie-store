<%@page import="java.util.*"%>
<%@page import="uts.users.User"%>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<%

%>
<div class="container text-center">
    <div class="row mt-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">Start with searching our collection</div>
                <div class="card-body">
                    <form method="POST" action="searchController.jsp">

                        <div class="form-group row">
                            <label for="title" class="col-sm-2 col-form-label">Title</label>
                            <div class="col-sm-10">
                                <div class="md-form mt-0">
                                    <input type="text"  name="title" class="form-control" id="title" placeholder="Search By Title">
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="genre" class="col-sm-2 col-form-label">Genre</label>
                            <div class="col-sm-10">
                                <div class="md-form mt-0">
                                    <input type="text" class="form-control" id="genre" name="genre" placeholder="Search By Genre">
                                </div>
                            </div>
                        </div>
                        <small class="form-text text-muted mb-4">
                            Wanna search by the released date range?
                        </small>
                        <div class="form-group row">
                            <label for="fromDate" class="col-sm-2 col-form-label">From</label>
                            <div class="col-sm-4">
                                <div class="md-form mt-0">
                                    
                                    <input type="date" name="fromDate" class="form-control" id="genre">
                                </div>
                            </div>
                            <label for="toDate" class="col-sm-1 col-form-label">To</label>
                            <div class="col-sm-5">
                                <div class="md-form mt-0">
                                    <input type="date" id="toDate" class="form-control" name="toDate">
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary mt-2 btn-large" type="submit">Search</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
