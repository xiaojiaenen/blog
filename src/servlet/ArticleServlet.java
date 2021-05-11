package servlet;

import Bean.Article;
import dao.Dao;
import service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ArticleServlet", value = "/admin_articleServlet")
public class ArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminService service=new AdminService(new Dao());
        List<Article> list = service.selectAll();
        List<Article> list2=new ArrayList<>();
        for (Article a:
             list) {
            String cateName = service.getCateName(a.getCateId());
            String[] s = a.getTagId().split(" ");
            StringBuffer bf=new StringBuffer();
            for (String str:
                 s) {
                String tagName = service.getTagName(str);
                bf.append(tagName+" ");
            }
            a.setCateId(cateName);
            a.setTagId(bf.toString());
            list2.add(a);
        }
        request.setAttribute("list",list2);
        request.getRequestDispatcher("admin/admin_article.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
