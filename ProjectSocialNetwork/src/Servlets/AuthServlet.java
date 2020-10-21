package Servlets;

import DB.DBManager;
import DB.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value="/auth")
public class AuthServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        Users user= DBManager.getUser(email);
        String redirect="/login.jsp?emailerror";
        if(user!=null){
            redirect="/login.jsp?passworderror";
            if(user.getPassword().equals(password)){
                request.getSession().setAttribute("CURRENT_USER",user);
                redirect="/feed.jsp";
            }
        }
        response.sendRedirect(redirect);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
