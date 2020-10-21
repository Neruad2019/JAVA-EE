package Servlets;

import DB.DBManager;
import DB.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/search")
public class SearchUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String substring=request.getParameter("user_search");
        int user_id=Integer.parseInt(request.getParameter("user_id"));
        ArrayList<Users> users= DBManager.searchUsers(substring,user_id);
        request.setAttribute("users",users);
        request.getRequestDispatcher("/myfriends.jsp").forward(request,response);
    }
}
