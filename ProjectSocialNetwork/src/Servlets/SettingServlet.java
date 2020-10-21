package Servlets;

import DB.DBManager;
import DB.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/settings")
public class SettingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int variant=Integer.parseInt(request.getParameter("variant"));
        int id=Integer.parseInt(request.getParameter("id"));
        Users user=new Users();
        user.setId((long)id);
        String redirect="/settings.jsp";
        try {
            switch (variant){
                case 1:
                    String email=request.getParameter("email");
                    String full_name=request.getParameter("full_name");
                    String birth_date=request.getParameter("birth_date");
                    user.setEmail(email);
                    user.setFull_name(full_name);
                    user.setBirthdate(birth_date);
                    System.out.println(DBManager.settings1(user));
                    break;
                case 2:
                    String url=request.getParameter("url");
                    System.out.println(DBManager.settings2(url,id));
                    break;
                case 3:
                    String old_password=request.getParameter("password");
                    String new_password=request.getParameter("new_password");
                    String re_new_password=request.getParameter("re_new_password");
                    String cur_password = DBManager.getUserPassword(id);
                    redirect="/settings.jsp?passworderror";
                    if(old_password.equals(cur_password)){
                        redirect="/settings.jsp?password_equal_error";
                        if(new_password.equals(re_new_password)){
                            redirect="/settings.jsp";
                            System.out.println(DBManager.settings3(new_password,id));
                        }
                    }
                    break;
            }
            request.getSession().setAttribute("CURRENT_USER",DBManager.getUserByID(id));

        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        response.sendRedirect(redirect);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
