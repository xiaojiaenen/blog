package servlet2;

import dao.Dao;
import service.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RandomArticle", value = "/RandomArticle")
public class RandomArticle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Service service =new Service(new Dao());
        String id = service.randomArticle();
        request.getRequestDispatcher("DetailServlet?id="+id).forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
