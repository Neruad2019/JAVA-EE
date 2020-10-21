<%@ page import="java.util.Date" %>
<%@ page import="java.time.Period" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.Post" %>
<%@ page import="DB.DBManager" %>
<%@ page import="DB.Chat" %>
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
            <li class="list-group-item"><strong><%=user.getFull_name()%>
                , <%=Period.between(datee, java.time.LocalDate.now()).getYears()%> years old</strong></li>
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

    <div class="col-md-5 ml-sm-4">
            <%
            ArrayList<Chat> chats = DBManager.getChats((int)(long)user.getId());
            if (chats != null) {

                for (int i = 0; i < chats.size(); i++) {
        %>
            <div class="card mt-sm-3">
                <div class="card-body d-flex">
                        <button type="submit" class="btn btn-outline-light m-0 p-0" style="height:85px;width:85px"><img
                                class="ml-sm-0 rounded-circle z-depth-2" width="85" height="85"
                                src="<%=chats.get(i).getUser_id().equals(user.getId())?DBManager.getUserByID((int)(long)chats.get(i).getOpponent_user_id()).getUrl_pic():DBManager.getUserByID((int)(long)chats.get(i).getUser_id()).getUrl_pic()%>"></button>
                    <div class="flex-fill ml-sm-3">
                        <h5 class="card-title d-inline"><%=chats.get(i).getUser_id().equals(user.getId())?DBManager.getUserByID((int)(long)chats.get(i).getOpponent_user_id()).getFull_name():DBManager.getUserByID((int)(long)chats.get(i).getUser_id()).getFull_name()%> </h5>
                        <small class="text-muted"><%=String.valueOf(chats.get(i).getLatest_message_time()).substring(0,16)%></small>
                        <p class="font-weight-normal text-break form-inline my-lg-3"><%=chats.get(i).getLatest_message_text()%></p>
                    </div>
                </div>
            </div>
        <%}}%>
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
