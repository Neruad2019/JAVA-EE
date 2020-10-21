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
%>
<div class="row justify-content-center mt-sm-4">
    <div class="col-md-3">
        <img class="d-block img-thumbnail" src="<%=user.getUrl_pic()%>">
        <ul class="list-group mt-sm-2 d-block">
            <%
                //DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMMM d, yyyy", Locale.ENGLISH);
                LocalDate datee = LocalDate.parse(user.getBirthdate()/*, formatter*/);
            %>
            <li class="list-group-item"><strong><%=user.getFull_name()%>, <%=Period.between(datee,java.time.LocalDate.now()).getYears()%> years old</strong></li>
            <li class="list-group-item"><strong><a class="nav-link active" href="/settings.jsp">
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
        <button type="button" class="btn btn-success btn-sm" data-toggle="modal"
                data-target="#Modal2" data-whatever="Name of City...">Add Post
        </button>
        <%
            ArrayList<Post> posts= DBManager.getPosts((int)(long)user.getId());
            for (int i=posts.size()-1;i>=0;i--){
        %>
        <div class="card mt-sm-3">
            <div class="card-body">
                <h5 class="card-title"><%=posts.get(i).getTitle()%></h5>
                <p class="card-text"><%=posts.get(i).getShort_content()%></p>
                <button type="button" class="btn btn-sm btn-outline-info my-2 my-sm-0" data-toggle="modal"
                        data-target="#ModalPost<%=i%>" data-whatever="Post...">More
                </button>
                <%--modal1--%>
                <div class="modal fade" id="ModalPost<%=i%>" tabindex="-1" role="dialog" aria-labelledby="ModalLabel<%=i%>"
                     aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="ModalLabel<%=i%>">Post</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h4 class="alert-heading text-center"><%=posts.get(i).getTitle()%></h4>
                                <p><%=posts.get(i).getContent()%></p>
                                <div class="nav justify-content-end">
                                    <input type="hidden" name="author_id" value="<%=user.getId()%>">
                                    <input type="hidden" type="text" name="add_date" value="<%=java.time.LocalDate.now()%>">
                                    <button type="button" class="btn btn-info btn-sm form-group" data-toggle="modal"
                                            data-target="#ModalPostEdit<%=i%>" data-whatever="Post...">EDIT</button>
                                    <form action="/editpost" method="post">
                                        <input type="hidden" name="edit_variant" value="2">
                                        <input type="hidden" name="id" value="<%=posts.get(i).getId()%>">
                                        <button type="submit" class="btn btn-danger ml-sm-1 btn-sm" <%--data-dismiss="modal"--%>>DELETE</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--modal2--%>
                <div class="modal fade" id="ModalPostEdit<%=i%>" tabindex="-1" role="dialog" aria-labelledby="ModalPostEditLabel<%=i%>"
                     aria-hidden="true">
                    <div class="modal-dialog modal-xl" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="ModalPostEditLabel<%=i%>">Edit Post</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="/editpost" method="post">
                                    <div class="form-group">
                                        <label class="col-form-label">Title:</label>
                                        <input type="text" class="form-control" name="title" value="<%=posts.get(i).getTitle()%>">
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-label">Short content:</label>
                                        <textarea class="form-control" name="short_content"><%=posts.get(i).getShort_content()%></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-label">Content:</label>
                                        <textarea class="form-control" name="content"><%=posts.get(i).getContent()%></textarea>
                                    </div>
                                    <hr>
                                    <div class="nav justify-content-end">
                                        <input type="hidden" name="author_id" value="<%=user.getId()%>">
                                        <input type="hidden" name="id" value="<%=posts.get(i).getId()%>">
                                        <input type="hidden" name="edit_variant" value="1">
                                        <button type="submit" type="button" class="btn btn-primary btn-sm">SAVE</button>
                                        <button type="button" class="btn btn-secondary ml-sm-1 btn-sm"
                                                data-dismiss="modal">CANCEL
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
            <div class="card-footer">
                <small class="text-muted">Posted on <%=String.valueOf(posts.get(i).getPost_date()).substring(0,10)%> by <%=user.getFull_name()%></small>
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
<%--Modal--%>
<div class="modal fade" id="Modal2" tabindex="-1" role="dialog" aria-labelledby="ModalLabel2"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalLabel2">Add New Post</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/addpost" method="post">
                    <div class="form-group">
                        <label class="col-form-label">Title:</label>
                        <input type="text" class="form-control" name="title">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Short content:</label>
                        <textarea class="form-control" name="short_content"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Content:</label>
                        <textarea class="form-control" name="content"></textarea>
                    </div>
                    <hr>
                    <div class="nav justify-content-end">
                        <input type="hidden" name="author_id" value="<%=user.getId()%>">
                        <input type="hidden" type="text" name="add_date" value="<%=java.time.LocalDate.now()%>">
                        <button type="submit" type="button" class="btn btn-primary btn-sm">ADD</button>
                        <button type="button" class="btn btn-secondary ml-sm-1 btn-sm"
                                data-dismiss="modal">CANCEL
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="vendor/footer.jsp"%>
</body>
</html>
