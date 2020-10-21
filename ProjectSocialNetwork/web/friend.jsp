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

    <script src="https://cdn.tiny.cloud/1/dt6dqq1fe7aotqi5tfa8hbqftpf2fqrbzr0jbr53xuxk9cq8/tinymce/4/tinymce.min.js" referrerpolicy="origin"></script>
    <script>tinymce.init({selector:'textarea'});</script>

</head>
<body>
<%@include file="vendor/navbar.jsp" %>
<%
    if(!ONLINE){
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }
    Users friend_page=(Users) request.getAttribute("friend_page");
%>
<div class="row justify-content-center mt-sm-4">
    <div class="col-md-3">
        <img class="d-block img-thumbnail" src="<%=friend_page.getUrl_pic()%>">
        <ul class="list-group mt-sm-2 d-block">
            <%
                //DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMMM d, yyyy", Locale.ENGLISH);
                LocalDate datee = LocalDate.parse(friend_page.getBirthdate()/*, formatter*/);
            %>
            <li class="list-group-item"><strong><%=friend_page.getFull_name()%>, <%=Period.between(datee,java.time.LocalDate.now()).getYears()%> years old</strong></li>
            <li class="list-group-item"><strong><button form="remFriend" class="nav-link active btn btn-outline-light py-0">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-dash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm5-.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
                </svg>
                Remove From Friends</button></strong>
            <form id="remFriend" action="/deletefriend" method="post">
                <input type="hidden" name="user_id" value="<%=user.getId()%>">
                <input type="hidden" name="friend_id" value="<%=friend_page.getId()%>">
            </form></li>
            <li class="list-group-item"><strong><a class="nav-link active" href="/chat.jsp?opponent_id=<%=friend_page.getId()%>">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-heading" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                    <path fill-rule="evenodd" d="M3 8.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"/>
                    <path d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-1z"/>
                </svg>
                Send Messages</a></strong></li>
            <li class="list-group-item text-danger"><strong><a class="nav-link active text-danger" href="/logout">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-door-closed" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v13h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V2zm1 13h8V2H4v13z"/>
                    <path d="M9 9a1 1 0 1 0 2 0 1 1 0 0 0-2 0z"/>
                </svg>
                Logout</a></strong></li>
        </ul>
    </div>
    <div class="col-md-5 ml-sm-4">
        <%
            ArrayList<Post> posts= DBManager.getPosts((int)(long)friend_page.getId());
            for (int i=posts.size()-1;i>=0;i--){
        %>
        <div class="card mt-sm-3">
            <div class="card-body">
                <h5 class="card-title"><%=posts.get(i).getTitle()%></h5>
                <p class="card-text"><%=posts.get(i).getShort_content()%></p>
                <button type="button" class="btn btn-sm btn-outline-info my-2 my-sm-0" data-toggle="modal"
                        data-target="#ModalFriendPost<%=i%>" data-whatever="Post...">More
                </button>
                <%--modal1--%>
                <div class="modal fade" id="ModalFriendPost<%=i%>" tabindex="-1" role="dialog" aria-labelledby="ModalFriendPostLabel<%=i%>"
                     aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="ModalFriendPostLabel<%=i%>">Post</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h4 class="alert-heading text-center"><%=posts.get(i).getTitle()%></h4>
                                <p><%=posts.get(i).getContent()%></p>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <div class="card-footer">
                <small class="text-muted">Posted on <%=String.valueOf(posts.get(i).getPost_date()).substring(0,10)%> by <%=friend_page.getFull_name()%></small>
            </div>
        </div>
        <%}%>
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

<%@include file="vendor/footer.jsp"%>
</body>
</html>
