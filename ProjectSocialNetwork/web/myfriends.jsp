<%@ page import="java.util.Date" %>
<%@ page import="java.time.Period" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.Post" %>
<%@ page import="DB.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/header.jsp" %>

    <script src="https://cdn.tiny.cloud/1/dt6dqq1fe7aotqi5tfa8hbqftpf2fqrbzr0jbr53xuxk9cq8/tinymce/4/tinymce.min.js"
            referrerpolicy="origin"></script>
    <script>tinymce.init({selector: 'textarea'});</script>

</head>
<body>
<%@include file="vendor/navbar.jsp" %>
<%
    if (!ONLINE) {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
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
            <li class="list-group-item"><strong><%=user.getFull_name()%>, <%=Period.between(datee, java.time.LocalDate.now()).getYears()%> years old</strong></li>
            <li class="list-group-item"><strong><a class="nav-link active" href="/settings.jsp">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-square" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                    <path fill-rule="evenodd" d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                </svg>
                Edit Profile</a></strong></li>
            <li class="list-group-item"><strong><a class="nav-link active" href="#">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-gear-fill" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 0 0-5.86 2.929 2.929 0 0 0 0 5.858z"/>
                </svg>
                Settings</a></strong></li>
            <li class="list-group-item text-danger"><strong><a class="nav-link active text-danger" href="/logout">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-door-closed" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v13h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V2zm1 13h8V2H4v13z"/>
                    <path d="M9 9a1 1 0 1 0 2 0 1 1 0 0 0-2 0z"/>
                </svg>
                Logout</a></strong></li>
        </ul>
    </div>
    <div class="col-md-5 ml-sm-4 px-5">

        <div class="card mt-sm-3">
            <div class="card-body">
                <form action="/search" method="get" class="form-inline my-2 my-lg-0">
                    <input class="form-control flex-fill mr-sm-2" name="user_search" type="search" placeholder="Search"
                           aria-label="Search">
                    <input type="hidden" name="user_id" value="<%=user.getId()%>">
                    <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </div>
        <%
            ArrayList<Users> users = (ArrayList<Users>) request.getAttribute("users");
            if (users != null) {

                for (int i = 0; i < users.size(); i++) {
                    LocalDate datefriend = LocalDate.parse(users.get(i).getBirthdate());
        %>
        <div class="card mt-sm-3">
            <div class="card-body d-flex">
                <img class="rounded-circle z-depth-2" width="85" height="85" src="<%=users.get(i).getUrl_pic()%>">
                <div class="flex-fill ml-sm-3">
                    <h5 class="card-title d-inline"><%=users.get(i).getFull_name()%>, </h5>
                    <small class="text-muted"><%=Period.between(datefriend, java.time.LocalDate.now()).getYears()%> years old</small>
                    <form action="/addfriend" method="post" class="form-inline my-lg-3">
                        <input type="hidden" name="user_id" value="<%=users.get(i).getId()%>">
                        <input type="hidden" name="requester_id" value="<%=user.getId()%>">
                        <button class="btn btn-outline-info btn-sm my-sm-0" type="submit">Add To Friends</button>
                    </form>
                </div>
            </div>
        </div>
        <%
            }
        } else {
            ArrayList<Users> usersRequests = (ArrayList<Users>) DBManager.requestedUsers((int) (long) user.getId());
            if (usersRequests != null && usersRequests.size() > 0) {
        %>
        <div class="card mt-sm-3">
            <div class="card-header">
                You have <%=usersRequests.size()%> new requests
            </div>
            <%
                LocalDate datefriend;
                for (int i = 0; i < usersRequests.size(); i++) {
                    datefriend = LocalDate.parse(usersRequests.get(i).getBirthdate());%>
            <div class="card-body d-flex">
                <img class="rounded-circle z-depth-2" width="85" height="85"
                     src="<%=usersRequests.get(i).getUrl_pic()%>">
                <div class="flex-fill ml-sm-3">
                    <h5 class="card-title d-inline"><%=usersRequests.get(i).getFull_name()%>, </h5>
                    <small class="text-muted"><%=Period.between(datefriend, java.time.LocalDate.now()).getYears()%> years old</small>
                    <form action="/confirm" method="post" class="form-inline my-lg-3">
                        <input type="hidden" name="friend_id" value="<%=usersRequests.get(i).getId()%>">
                        <input type="hidden" name="user_id" value="<%=user.getId()%>">
                        <button class="btn btn-outline-success btn-sm my-sm-0" name="variant" value="1" type="submit">
                            Confirm
                        </button>
                        <button class="btn btn-outline-warning btn-sm ml-sm-2" name="variant" value="2" type="submit">
                            Reject
                        </button>
                    </form>
                </div>
            </div>
            <%}%>
        </div>
        <%
            }
            ArrayList<Users> friends = (ArrayList<Users>) DBManager.getFriends((int) (long) user.getId());
            for (int i = 0; i < friends.size(); i++) {
                LocalDate datefriends = LocalDate.parse(friends.get(i).getBirthdate());
        %>
        <div class="card mt-sm-3">
            <div class="card-body d-flex">
                <form action="/friend" method="post">
                    <input type="hidden" name="friend_id" value="<%=friends.get(i).getId()%>">
                    <input type="hidden" name="friend_name" value="<%=friends.get(i).getFull_name()%>">
                    <input type="hidden" name="friend_birth_date" value="<%=friends.get(i).getBirthdate()%>">
                    <input type="hidden" name="friend_img_url" value="<%=friends.get(i).getUrl_pic()%>">
                    <button type="submit" class="btn btn-outline-light m-0 p-0" style="height:85px;width:85px"><img
                            class="ml-sm-0 rounded-circle z-depth-2" width="85" height="85"
                            src="<%=friends.get(i).getUrl_pic()%>"></button>
                </form>
                <div class="flex-fill ml-sm-3">
                    <h5 class="card-title d-inline"><%=friends.get(i).getFull_name()%>, </h5>
                    <small class="text-muted"><%=Period.between(datefriends, java.time.LocalDate.now()).getYears()%> years old</small>
                    <a class="nav-link active mt-3 p-0" href="/chat.jsp?opponent_id=<%=friends.get(i).getId()%>"><button class="btn btn-outline-info btn-sm my-sm-0">Send Message</button></a>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>


    </div>


    <div class="col-md-3 ml-sm-4">
        <div class="card bg-light mb-3" style="max-width: 18rem;">
            <div class="card-header bg-info">My Games</div>
            <div class="card-body">
                <h6 class="card-title">Tanki Online</h6>
                <h6 class="card-title">Tetris</h6>
                <h6 class="card-title">Durak</h6>
            </div>
        </div>
    </div>
</div>
<%@include file="vendor/footer.jsp" %>
</body>
</html>
