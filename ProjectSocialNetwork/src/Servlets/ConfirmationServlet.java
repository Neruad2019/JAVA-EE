package Servlets;

import DB.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(value = "/confirm")
public class ConfirmationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int variant=Integer.parseInt(request.getParameter("variant"));
        int friend_id=Integer.parseInt(request.getParameter("friend_id"));
        int user_id=Integer.parseInt(request.getParameter("user_id"));
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        try{
            if (variant==1){

                DBManager.addFriend(user_id,friend_id,timestamp);
                DBManager.addFriend(friend_id,user_id,timestamp);
            }
            DBManager.deleteRequest(user_id,friend_id);
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
    response.sendRedirect("/myfriends.jsp");
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
