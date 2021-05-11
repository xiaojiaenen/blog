<%--
  Created by IntelliJ IDEA.
  User: xiaojia
  Date: 2021/1/31
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
            <link type="favicon" rel="shortcut icon" href="${pageContext.request.getContextPath()}/favicon.ico" />


</head>
<body>
<nav class="navbar bg-dark navbar-dark float-left">
    <ul class="navbar-nav my_navbar">
        <li class="nav-item">
            <a href="${pageContext.request.getContextPath()}/IndexServlet" class="navbar-brand" style="color: rgba(255,255,255,.5);"><strong>xiaojia's
                blog</strong></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.getContextPath()}/admin/admin_index.jsp"><i class="fas fa-home"></i>首页</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.getContextPath()}/admin_articleServlet"><i class="far fa-clipboard"></i>文章管理</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.getContextPath()}/admin_cateServlet"><i class="fas fa-th-large"></i>分类管理</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.getContextPath()}/admin_tagServlet"><i class="fas fa-tags"></i>标签管理</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#"><i class="fas fa-user"></i>其他</a>
        </li>
    </ul>

</nav>

</body>
</html>
