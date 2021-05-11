<%--
  Created by IntelliJ IDEA.
  User: xiaojia
  Date: 2021/1/31
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loading...</title>
    <link type="favicon" rel="shortcut icon" href="${pageContext.request.getContextPath()}/favicon.ico" />
    <link href="${pageContext.request.getContextPath()}/css/scrollbar.css" rel="stylesheet">
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?7a2beaf0fd2003ab4a8faae1bb2f69ed";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();

        (function(){
            var bp = document.createElement('script');
            var curProtocol = window.location.protocol.split(':')[0];
            if (curProtocol === 'https'){
                bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
            }
            else{
                bp.src = 'http://push.zhanzhang.baidu.com/push.js';
            }
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(bp, s);
        })();

    </script>

</head>
<body>
<nav class="navbar navbar-expand-lg bg-light shadow navbar-light fixed-top">
    <a href="${pageContext.request.getContextPath()}/IndexServlet" class="navbar-brand"><strong>xiaojia's blog</strong></a>
    <!--    <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=280 height=52 src="//music.163.com/outchain/player?type=2&id=1350160463&auto=0&height=32"></iframe>-->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
        <ul class="navbar-nav my_navbar">

            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.getContextPath()}/IndexServlet"><i class="fas fa-home"></i>首页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.getContextPath()}/ArchiveServlet"><i class="fas fa-archive"></i>归档</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link" href="${pageContext.request.getContextPath()}/CateServlet"><i class="fas fa-th-large"></i>分类</a>
<%--                <div class="dropdown-menu bg-light">--%>
<%--                    <a href="${pageContext.request.getContextPath()}/CateServlet?cate=" class="dropdown-item">hadoop</a>--%>
<%--                </div>--%>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.getContextPath()}/TagServlet"><i class="fas fa-tags"></i>标签</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.getContextPath()}/DanmuServlet"><i class="far fa-comment-dots"></i>留言</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.getContextPath()}/about.jsp"><i class="fas fa-user"></i>关于</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.getContextPath()}/RandomArticle"><i class="fas fa-fingerprint"></i></a>
            </li>
        <c:if test="${sessionScope.isLogin=='true'}">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.getContextPath()}/admin/admin_index.jsp"><i class="fas fa-grin-tongue-squint"></i>后台</a>
            </li>
        </c:if>
        </ul>
    </div>
</nav>
<script>
    (function(){
        var src = "https://jspassport.ssl.qhimg.com/11.0.1.js?d182b3f28525f2db83acfaaf6e696dba";
        document.write('<script src="' + src + '" id="sozz"><\/script>');
    })();
</script>
</body>
</html>
