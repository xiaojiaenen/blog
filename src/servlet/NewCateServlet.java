package servlet;

import Bean.Cate;
import Utils.UuidUtil;
import dao.Dao;
import service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "NewCateServlet", value = "/admin_newCate")
public class NewCateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminService service=new AdminService(new Dao());
        service.insertCate(new Cate(UuidUtil.getUuid(),request.getParameter("cate")));
        response.sendRedirect("admin_cateServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
