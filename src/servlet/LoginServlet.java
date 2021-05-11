package servlet;

import Bean.Admin;
import dao.Dao;
import service.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String pwd = request.getParameter("pwd");
        Service service=new Service(new Dao());
        List<Admin> admin = service.getAdmin();
        boolean isLogin=false;
        for (Admin a:
             admin) {
            if(user.equals(a.getUser())&&pwd.equals(a.getPwd())){
                isLogin=true;
                break;
            }
        }
        HttpSession session = request.getSession();

        if(isLogin){
            session.setAttribute("isLogin","true");
            response.sendRedirect("admin/admin_index.jsp");
        }else {
            session.setAttribute("isLogin","false");
            response.sendRedirect("login.jsp");
        }
    }
}
