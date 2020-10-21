package Servlets;

import DB.DBManager;
import DB.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(value = "/addpost")
public class AddPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title=request.getParameter("title");
        String short_content=request.getParameter("short_content");
        String content=request.getParameter("content");
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Long author_id=(long)Integer.parseInt(request.getParameter("author_id"));
        Post post=new Post();
        post.setAuthor_id(author_id);
        post.setContent(content);
        post.setShort_content(short_content);
        post.setAuthor_id(author_id);
        post.setPost_date(timestamp);
        post.setTitle(title);
        DBManager.addPost(post);
        response.sendRedirect("/profile.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
