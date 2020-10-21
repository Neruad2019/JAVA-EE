package Servlets;

import DB.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/message")
public class SendMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int opponent_id=Integer.parseInt(request.getParameter("opponent_id"));
        int user_id=Integer.parseInt(request.getParameter("user_id"));
        String send=request.getParameter("send");
        if(!DBManager.isChatExists(user_id,opponent_id)){
            DBManager.addChat(user_id,opponent_id);
        }
        int chat_id=DBManager.getChatid(user_id,opponent_id);
        if(chat_id>=0){
            DBManager.addMessage(chat_id,user_id,opponent_id,send);
        }
        response.sendRedirect("/chat.jsp?opponent_id="+opponent_id);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
