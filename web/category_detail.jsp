<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<!DOCTYPE html>--%>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${name}-xiaojia's blog</title>
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

        a {
            color: #000;
        }

        .mycol {
            height: 21.75rem;
            padding-bottom: 5px;
            padding-top: 5px;
        }

        .caption p {
            color: #3c4858;
            display: inline;
            overflow: hidden;
        }

        .caption p:hover {
            color: #30a9de;
            display: inline;
        }

        a:hover {
            color: #30a9de;
            text-decoration: none;
        }

        small * {
            color: #718096;
        }

        small {
            margin: 5px;
        }

        footer span {
            font-size: 12px;
            color: #545f6d;
            text-align: center;
        }

        .row {
            margin-top: 5px;
            margin-bottom: 5px;
            padding: 3px;
        }

        .card-img-top {
            padding: 2px;
        }

        .card-body {
            overflow: hidden;
        }

        .mycol .card {
            height: 21.125rem;
        }


    </style>
</head>
<body>
<%@include file="header.jsp"%>


<div class="card mycard">
    <img class="card-img-top" src="img/46.jpg">
    <div class="card-img-overlay justify-content-center d-flex">
        <div class="align-self-center">
            <h1 class="card-title text-white">${name}</h1>
        </div>
    </div>
</div>


<div class="container border rounded shadow">
    <div class="row">
        <c:forEach var="l" items="${list}">
            <div class="col-lg-3 col-md-4 col-sm-6 mycol">
                <div class="card shadow">
                <div style="height:200px;overflow:hidden;">
                    <img class="rounded card-img-top" src="img/${l.img}.jpg">
                    </div>
                    <div class="card-body">
                        <a href="#" class="thumbnail justify-content-center">
                            <div class="caption">
                                <h5><a href="${pageContext.request.getContextPath()}/DetailServlet?id=${l.id}">${l.title}</a></h5>
                                    <%--                                <a href="#"><p>我是内容简介</p></a><br>--%>

                            </div>
                        </a>
                    </div>
                    <div class="card-footer bg-transparent">
                        <small><i class="fas fa-feather-alt"></i><a href="#">${l.author}</a></small>
                        <small><i class="far fa-calendar-alt"></i><a href="#">${l.pubdate}</a></small><br>
                        <small><i class="fas fa-th-large"></i><a href="#">${l.cateId}</a></small>
                        <small><i class="fas fa-tags"></i><a href="#">${l.tagId}</a></small>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
<%--    <ul class="pagination justify-content-center">--%>
<%--        <li class="page-item disabled shadow"><a class="page-link" href="#">Prev</a></li>--%>
<%--        <li class="page-item active shadow"><a class="page-link" href="#">1</a></li>--%>
<%--        <li class="page-item shadow"><a class="page-link" href="#">2</a></li>--%>
<%--        <li class="page-item shadow"><a class="page-link" href="#">3</a></li>--%>
<%--        <li class="page-item shadow"><a class="page-link" href="#">Next</a></li>--%>
<%--    </ul>--%>
</div>
<br>

<%@include file="footer.jsp"%>
<br>

</body>
</html>