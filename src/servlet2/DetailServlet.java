package servlet2;

import Bean.Article;
import Bean.Comment;
import dao.Dao;
import service.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DetailServlet", value = "/DetailServlet")
public class DetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Service service = new Service(new Dao());
        String id=request.getParameter("id");
        service.setView(id);
        Article article = service.selectById(request.getParameter("id"));
        String cateName = service.getCateName(article.getCateId());
        String[] s = article.getTagId().split(" ");
        StringBuffer bf = new StringBuffer();
        for (String str :
                s) {
            String tagName = service.getTagName(str);
            bf.append(tagName + " ");
        }
        String date = article.getPubdate();
        String[] s1 = date.split(" ");
        article.setPubdate(s1[0]);
        article.setCateId(cateName);
        article.setTagId(bf.toString());

        List<Comment> comments = service.selectAllComment(id);
        request.setAttribute("article",article);
        request.setAttribute("list",comments);
        request.getRequestDispatcher("detail.jsp").forward(request,response);
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
