package servlet2;

import Bean.Danmu;
import dao.Dao;
import service.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DanmuServlet", value = "/DanmuServlet")
public class DanmuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Service service=new Service(new Dao());
        List<Danmu> list = service.selectAllDanmu();
        request.setAttribute("list",list);
        request.getRequestDispatcher("danmu.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
