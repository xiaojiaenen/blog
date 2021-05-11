package servlet2;

import Bean.Article;
import dao.Dao;
import service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TagDetailServlet", value = "/TagDetailServlet")
public class TagDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        AdminService service=new AdminService(new Dao());
        List<Article> list = service.selectArticleByTagId(id);
        request.setAttribute("list",list);
        String tagName = service.getTagName(id);
        request.setAttribute("name",tagName);
        request.getRequestDispatcher("category_detail.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
