package servlet2;

import Bean.Article;
import dao.Dao;
import service.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ArchiveServlet", value = "/ArchiveServlet")
public class ArchiveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Service service=new Service(new Dao());
        List<Article> list = service.selectAllArticle();
        request.setAttribute("list",list);
        request.getRequestDispatcher("archive.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
