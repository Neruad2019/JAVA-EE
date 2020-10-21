package Servlets;

import DB.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/friend")
public class ToFriendPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int friend_id=Integer.parseInt(request.getParameter("friend_id"));
        String friend_name=request.getParameter("friend_name");
        String friend_birth_date=request.getParameter("friend_birth_date");
        String friend_img_url=request.getParameter("friend_img_url");
        Users friend_page=new Users();
        friend_page.setId((long)friend_id);
        friend_page.setFull_name(friend_name);
        friend_page.setBirthdate(friend_birth_date);
        friend_page.setUrl_pic(friend_img_url);
        request.setAttribute("friend_page",friend_page);
        request.getRequestDispatcher("/friend.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
