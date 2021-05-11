package servlet2;

import Bean.Danmu;
import Utils.UuidUtil;
import dao.Dao;
import service.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AddDanmuServlet", value = "/AddDanmuServlet")
public class AddDanmuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("data");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowDate = df.format(new Date());
        String id= UuidUtil.getUuid();
        Service service=new Service(new Dao());
        service.insertDanmu(new Danmu(id,nowDate,content));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
