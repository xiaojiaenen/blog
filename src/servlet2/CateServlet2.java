package servlet2;

import Bean.Cate;
import dao.Dao;
import service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CateServlet2", value = "/CateServlet")
public class CateServlet2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminService service=new AdminService(new Dao());
        List<Cate> list = service.selectAllCate();
        request.setAttribute("list",list);
        request.getRequestDispatcher("cate.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
