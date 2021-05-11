<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>归档-xiaojia's blog</title>
    <link href="${pageContext.request.getContextPath()}/css/scrollbar.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/fontawesome-free-5.15.2-web/css/all.css" rel="stylesheet">
    <script src="${pageContext.request.getContextPath()}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/bootstrap.js"></script>
    <style>
        i {
            padding: 3px;
        }

        .navbar {
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

        .card-body a {
            color: #5d5d5d;
            line-height: 2;
        }

        .card-body a:hover {
            color: #000;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>


<div class="card mycard">
    <img class="card-img-top" src="img/1.jpg">
    <div class="card-img-overlay justify-content-center d-flex">
        <div class="align-self-center">
            <h1 class="card-title text-white">归档</h1>
        </div>
    </div>
</div>

<div class="container shadow rounded">
    <div class="row">
            <div class="col-lg-12">
                <div class="card">
                        <%--                <div class="card-header bg-light text-center">--%>
                        <%--                    <span style="font-size: 18px"><strong>2021-01</strong></span>--%>
                        <%--                </div>--%>
                    <div class="card-body text-center">
                        <c:forEach var="l" items="${list}">
                        <a class="card-link" href="${pageContext.request.getContextPath()}/DetailServlet?id=${l.id}">
                                ${l.title}
                        </a><br>
                        </c:forEach>
                    </div>
                </div>
            </div>

    </div>
</div>

<br>
<%@include file="footer.jsp"%>
<br>
</body>
</html>