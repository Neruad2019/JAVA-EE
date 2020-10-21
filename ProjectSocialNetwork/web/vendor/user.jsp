<%@ page import="DB.Users" %><%
    Users user=(Users)request.getSession().getAttribute("CURRENT_USER");
    boolean ONLINE=false;
    if(user!=null){
        ONLINE=true;
    }
%>
