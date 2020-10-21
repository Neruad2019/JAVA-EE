<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/header.jsp" %>
</head>
<body>
<%@include file="vendor/navbar.jsp" %>
<div class="row justify-content-center">
    <div class="col-md-5">
        <h2 class="my-sm-5 text-center">Registration</h2>
        <%
            String Err=request.getParameter("emailerror");
            if(Err!=null){
        %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            Email already exists
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <%}%>
        <%
            Err=request.getParameter("passworderror");
            if(Err!=null){
        %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            Incorrect passwords
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <%}%>
        <form action="/register" method="post">
            <div class="form-group">
                <label>Email address</label>
                <input type="email" class="form-control mb-sm-2" name="email" required>
                <h6 class="card-subtitle mb-2 text-muted"><small>Input your email</small></h6>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control mb-sm-2" name="password" required>
                <h6 class="card-subtitle mb-2 text-muted"><small>Input your password</small></h6>
            </div>
            <div class="form-group">
                <label>Re-Password</label>
                <input type="password" class="form-control mb-sm-2" name="re_password" required>
                <h6 class="card-subtitle mb-2 text-muted"><small>Re-input your password again</small></h6>
            </div>
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" class="form-control mb-sm-2" name="full_name" required>
                <h6 class="card-subtitle mb-2 text-muted"><small>Input your full name</small></h6>
            </div>
            <div class="form-group">
                <label>Birthdate</label>
                <input type="date" class="form-control mb-sm-2" name="birth_date" required>
                <h6 class="card-subtitle mb-2 text-muted"><small>Input your birthdate</small></h6>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary mt-sm-4" style="background-color: #180b7a">Register</button>
            </div>
        </form>
    </div>
</div>
<%@include file="vendor/footer.jsp"%>
</body>
</html>
