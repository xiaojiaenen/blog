package filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(true);
        //获取请求路径
        String path = req.getRequestURI();
        //获取session中作为判断的字段
        String isLogin = (String) session.getAttribute("isLogin");
        //判断请求的 路径中是否包含了 登录页面的请求
        //如果包含了，那么不过滤 继续执行操作
        String contextPath=req.getContextPath();
        String uri=req.getRequestURI();
        String p=uri.replace(contextPath,"");
        if (path.indexOf("admin_") > -1) {
            if (isLogin == null || "false".equals(isLogin)) {
                resp.sendRedirect(uri.replace(p,"/login.jsp"));
            } else {
                chain.doFilter(req, resp);
            }
        } else {
            //如不包含，那么就要判断 session中否有标志，如果没有标志，那么不让他看，让他去登录，反之执行操作！
            chain.doFilter(req,resp);
        }
    }
}
