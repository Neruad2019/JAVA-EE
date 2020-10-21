package Servlets;

import DB.DBManager;
import DB.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/editpost")
public class EditPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int variant=Integer.parseInt(request.getParameter("edit_variant"));
        Long id=(long)Integer.parseInt(request.getParameter("id"));
        try {
            switch (variant){
                case 1:
                    String title=request.getParameter("title");
                    String short_content=request.getParameter("short_content");
                    String content=request.getParameter("content");
                    Long author_id=(long)Integer.parseInt(request.getParameter("author_id"));
                    Post post=new Post();
                    post.setAuthor_id(author_id);
                    post.setId(id);
                    post.setContent(content);
                    post.setShort_content(short_content);
                    post.setTitle(title);
                    DBManager.setPost(post);
                    break;
                case 2:
                    DBManager.deletePost((int)(long)id);
                    break;
            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        response.sendRedirect("/profile.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
