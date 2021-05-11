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
        //��ȡ����·��
        String path = req.getRequestURI();
        //��ȡsession����Ϊ�жϵ��ֶ�
        String isLogin = (String) session.getAttribute("isLogin");
        //�ж������ ·�����Ƿ������ ��¼ҳ�������
        //��������ˣ���ô������ ����ִ�в���
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
            //�粻��������ô��Ҫ�ж� session�з��б�־�����û�б�־����ô��������������ȥ��¼����ִ֮�в�����
            chain.doFilter(req,resp);
        }
    }
}
