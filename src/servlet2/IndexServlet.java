package servlet2;

import Bean.Article;
import Utils.UserUtil;
import dao.Dao;
import service.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "IndexServlet", value = "/IndexServlet")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Service service = new Service(new Dao());
        int now = 1;
        int count = 12;
        int total = service.getArticleCount();
        int page = 0;
        if (total % count == 0) {
            page = total / count;
        } else {
            page = total / count + 1;
        }
        if (request.getParameter("page") == null) {
            now = 1;
        } else {
            now = Integer.parseInt(request.getParameter("page"));
        }

        List<Article> list = service.selectAll((now - 1) * count, count);
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

        request.setAttribute("list", list2);
        request.setAttribute("now", now);
        request.setAttribute("page", page);
        request.getRequestDispatcher("indexPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
