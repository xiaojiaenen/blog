package servlet;

import Bean.Tag;
import dao.Dao;
import service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TagServlet", value = "/admin_tagServlet")
public class TagServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminService service=new AdminService(new Dao());
        List<Tag> list = service.selectAllTag();
        request.setAttribute("list",list);
        request.getRequestDispatcher("admin/admin_tags.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
