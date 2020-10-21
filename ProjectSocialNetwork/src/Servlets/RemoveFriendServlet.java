package Servlets;

import DB.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/deletefriend")
public class RemoveFriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id=Integer.parseInt(request.getParameter("user_id"));
        int friend_id=Integer.parseInt(request.getParameter("friend_id"));
        DBManager.deleteFriend(user_id,friend_id);
        response.sendRedirect("/myfriends.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
