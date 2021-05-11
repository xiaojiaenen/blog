package servlet;

import Bean.Article;
import Bean.Cate;
import dao.Dao;
import service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ModifyServlet", value = "/admin_modifyServlet")
public class ModifyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminService service=new AdminService(new Dao());
        String id = request.getParameter("id");
        Article article = service.selectById(id);
        String cateId = article.getCateId();
        String cateName = service.getCateName(cateId);
        String[] s = article.getTagId().split(" ");
        StringBuffer bf=new StringBuffer();
        for (String str:
             s) {
            bf.append(service.getTagName(str)+" ");
        }
        article.setCateId(cateName);
        article.setTagId(bf.toString());
        List<Cate> list = service.selectAllCate();
        request.setAttribute("list",list);
        request.setAttribute("bean",article);

        request.getRequestDispatcher("admin/admin_modifyarticle.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
