package servlet2;

import Bean.Comment;
import Utils.UserUtil;
import Utils.UuidUtil;
import dao.Dao;
import kohgylw.kcnamer.core.KCNamer;
import service.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "CommentServlet", value = "/CommentServlet")
public class CommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("data");
        String articleId = request.getParameter("id");
        KCNamer k=new KCNamer(); //使用默认规则实例化KCNamer工具
        String name=k.getRandomName(); //生成一个默认规则的、不区分男女风格的、不限长度的中文名
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowDate = df.format(new Date());
        String img=UserUtil.getRandomNum(58);
        String header=UserUtil.getHeader(request);
        String ip=UserUtil.getRemoteIP(request);
        String id= UuidUtil.getUuid();
        Comment comment=new Comment(id,articleId,name,img,nowDate,header,ip,content);
        Service service=new Service(new Dao());
        service.insertComment(comment);
        service.setComment(articleId);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
