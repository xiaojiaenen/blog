package servlet;

import Bean.Cate;
import dao.Dao;
import service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NewServlet", value = "/admin_newServlet")
public class NewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminService service=new AdminService(new Dao());
        List<Cate> list = service.selectAllCate();
        request.setAttribute("list",list);
        request.getRequestDispatcher("admin/admin_newarticle.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
