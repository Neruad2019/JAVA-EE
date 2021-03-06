<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/header.jsp" %>
</head>
<body>
<%@include file="vendor/navbar.jsp" %>
<%
    if(!ONLINE){
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }
%>
<div class="row justify-content-center mt-sm-4">
    <div class="col-md-3">
        <img class="d-block img-thumbnail" src="<%=user.getUrl_pic()%>">
        <ul class="list-group mt-sm-2 d-block">
            <%
                //DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMMM d, yyyy", Locale.ENGLISH);
                LocalDate datee = LocalDate.parse(user.getBirthdate()/*, formatter*/);
            %>
            <li class="list-group-item"><strong><%=user.getFull_name()%>, <%=Period.between(datee,java.time.LocalDate.now()).getYears()%> year old</strong></li>
            <li class="list-group-item"><strong><a class="nav-link active" href="#">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                    <path fill-rule="evenodd" d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                </svg>
                Edit Profile</a></strong></li>
            <li class="list-group-item"><strong><a class="nav-link active" href="#">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-gear-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 0 0-5.86 2.929 2.929 0 0 0 0 5.858z"/>
                </svg>
                Settings</a></strong></li>
            <li class="list-group-item text-danger"><strong><a class="nav-link active text-danger" href="/logout">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-door-closed" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v13h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V2zm1 13h8V2H4v13z"/>
                    <path d="M9 9a1 1 0 1 0 2 0 1 1 0 0 0-2 0z"/>
                </svg>
                Logout</a></strong></li>
        </ul>
    </div>
    <div class="col-md-5 ml-sm-4">
        <form action="/settings" method="post">
            <input type="hidden" name="id" value="<%=user.getId()%>">
            <div class="form-group">
                <h2 class="text-center">Sign in</h2>
                <label>Email address</label>
                <input type="email" class="form-control mb-sm-2" name="email" value="<%=user.getEmail()%>">
            </div>
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" class="form-control mb-sm-2" name="full_name" value="<%=user.getFull_name()%>">
            </div>
            <div class="form-group">
                <label>Birthdate</label>
                <input type="date" class="form-control mb-sm-2" name="birth_date" value="<%=user.getBirthdate()%>">
            </div>
            <div class="form-group">
                <input type="hidden" name="variant" value="1">
                <button type="submit" class="btn btn-primary mt-sm-4" style="background-color: #180b7a">Update Profile</button>
            </div>
        </form>
        <hr class="my-2">
        <form action="/settings" method="post">
            <input type="hidden" name="id" value="<%=user.getId()%>">
            <div class="form-group">
                <h2 class="my-sm-5 text-center">Edit Picture</h2>
                <label>URL</label>
                <input type="text" class="form-control mb-sm-2" name="url" value="<%=user.getUrl_pic()%>">
                <h6 class="card-subtitle mb-2 text-muted"><small>Input url of your profile photo</small></h6>
            </div>
            <div class="form-group">
                <input type="hidden" name="variant" value="2">
                <button type="submit" class="btn btn-primary mt-sm-4" style="background-color: #180b7a">Update URL</button>
            </div>
        </form>
        <hr class="my-2">
        <form action="/settings" method="post">
            <input type="hidden" name="id" value="<%=user.getId()%>">
            <div class="form-group">
                <h2 class="my-sm-5 text-center">Change Password</h2>
                <%
                    String Err=request.getParameter("passworderror");
                    if(Err!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Invalid input current password
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%}%>
                <%
                    Err=request.getParameter("password_equal_error");
                    if(Err!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Incorrect input passwords
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%}%>
                <label>Current Password</label>
                <input type="password" class="form-control mb-sm-2" name="password">
                <h6 class="card-subtitle mb-2 text-muted"><small>Input current password</small></h6>
            </div>
            <div class="form-group">
                <label>New Password</label>
                <input type="password" class="form-control mb-sm-2" name="new_password">
                <h6 class="card-subtitle mb-2 text-muted"><small>Input new password</small></h6>
            </div>
            <div class="form-group">
                <label>Re-Input New Password</label>
                <input type="password" class="form-control mb-sm-2" name="re_new_password">
                <h6 class="card-subtitle mb-2 text-muted"><small>Re-input new password</small></h6>
            </div>
            <div class="form-group">
                <input type="hidden" name="variant" value="3">
                <button type="submit" class="btn btn-primary mt-sm-4" style="background-color: #180b7a">Change Password</button>
            </div>
        </form>
    </div>
    <div class="col-md-3 ml-sm-4">

    </div>
</div>
<%@include file="vendor/footer.jsp"%>
</body>
</html>
