package servlet;

import Bean.Article;
import Bean.Tag;
import Utils.UserUtil;
import Utils.UuidUtil;
import dao.Dao;
import service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/admin_saveData")
public class SaveDataServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String data = request.getParameter("data");
        String title = request.getParameter("title");
        String cate = request.getParameter("cate");
        String tags = request.getParameter("tags").trim();
        String id = UuidUtil.getUuid();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowDate = df.format(new Date());
        AdminService service = new AdminService(new Dao());
        String cateId = service.getCateId(cate);
        String[] split = tags.split(" ");
        StringBuffer buffer = new StringBuffer();
        List<Tag> tags1 = service.selectAllTag();
        List<String> list = new ArrayList<>();
        for (Tag t :
                tags1) {
            list.add(t.getName());
        }

        for (String s :
                split) {
            if (!list.contains(s)) {
                service.insertTag(new Tag(UuidUtil.getUuid(), s));
                buffer.append(service.getTagId(s) + " ");
            }else {
                buffer.append(service.getTagId(s) + " ");
            }
        }

        Article article = new Article(id, title, "xiaojia", nowDate, nowDate, cateId, buffer.toString().trim(), 0, 0, 0, data, UserUtil.getRandomNum(66));
        service.insertArticle(article);
        response.getWriter().write("发布成功");

    }
}
