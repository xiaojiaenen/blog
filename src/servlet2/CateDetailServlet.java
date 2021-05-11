package servlet2;

import Bean.Article;
import dao.Dao;
import service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CateDetailServlet", value = "/CateDetailServlet")
public class CateDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        AdminService service=new AdminService(new Dao());
        List<Article> list = service.selectArticleByCateId(id);
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
            String date=a.getPubdate();
            String[] s1 = date.split(" ");
            a.setPubdate(s1[0]);
            a.setCateId(cateName);
            a.setTagId(bf.toString());
            list2.add(a);
        }
        request.setAttribute("list",list);
        String cateName = service.getCateName(id);
        request.setAttribute("name",cateName);
        request.getRequestDispatcher("category_detail.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
