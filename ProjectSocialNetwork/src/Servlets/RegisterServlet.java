package Servlets;

import DB.DBManager;
import DB.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String re_password=request.getParameter("re_password");
        String full_name=request.getParameter("full_name");
        String birth_date=request.getParameter("birth_date");
        Users user= DBManager.getUser(email);
        String redirect="/register.jsp?emailerror";
        if(user==null){
            redirect="/register.jsp?passworderror";
            if(re_password.equals(password)){
                redirect="/login.jsp";
                Users new_user =new Users();
                new_user.setEmail(email);
                new_user.setBirthdate(birth_date);
                new_user.setFull_name(full_name);
                new_user.setPassword(password);
                new_user.setUrl_pic("https://99181-282044-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2016/05/icon-user-default.png");
                DBManager.setUser(new_user);
            }
        }
        response.sendRedirect(redirect);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
