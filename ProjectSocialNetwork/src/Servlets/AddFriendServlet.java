package Servlets;

import DB.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(value = "/addfriend")
public class AddFriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id=Integer.parseInt(request.getParameter("user_id"));
        int requester_id=Integer.parseInt(request.getParameter("requester_id"));
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        DBManager.addRequest(user_id,requester_id,timestamp);
        response.sendRedirect("/myfriends.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
