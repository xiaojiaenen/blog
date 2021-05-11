<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>标签-xiaojia's blog</title>
    <link href="${pageContext.request.getContextPath()}/css/scrollbar.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/fontawesome-free-5.15.2-web/css/all.css" rel="stylesheet">
    <script src="${pageContext.request.getContextPath()}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/bootstrap.js"></script>
<style>
    i {
        padding: 3px;
    }

    .navbar{
        height: 45px;
    }

    .my_navbar {
        margin-right: 15px;
    }

    .navbar li {
        margin-right: 5px;
    }


    footer span {
        font-size: 12px;
        color: #545f6d;
        text-align: center;
    }

    .card img {
        width: 100%;
    }

    .mycard {
        height: 42.5rem;
        overflow: hidden;
    }
</style>
</head>
<body>
<%@include file="header.jsp"%>


<div class="card mycard">
    <img class="card-img-top" src="img/1.jpg">
    <div class="card-img-overlay justify-content-center d-flex">
        <div class="align-self-center">
            <h1 class="card-title text-white">标签</h1>
        </div>
    </div>
</div>

<div class="container shadow rounded">
    <div class="row">
        <c:forEach var="l" items="${list}">
        <div class="col-lg-2 col-md-3 col-sm-4">
            <div class="card">
                <button class="btn btn-info" onclick="javascript:window.location.href='${pageContext.request.getContextPath()}/TagDetailServlet?id=${l.id}'" type="button">${l.name}</button>
            </div>
        </div>
        </c:forEach>
    </div>
</div>

<br>
<%@include file="footer.jsp"%>
<br>
</body>
</html>