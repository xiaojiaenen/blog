<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="baidu-site-verification" content="code-UwbyYIwYMG" />
    <meta name="keywords" content="小贾个人博客,小贾,xiaojia,xiaojia blog">
    <meta name="description" content="xiaojia's blog是一个记录生活,分享知识的个人博客。
主要记录生活的点点滴滴,分享学习上的经验知识,茫茫人海中留下些许足迹。">
    <meta name="360-site-verification" content="fb2617be1ed927fed1fb9d8b20763154" />
    <script data-ad-client="ca-pub-2362415110888499" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

    <title>首页-xiaojia's blog</title>
    <link href="${pageContext.request.getContextPath()}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/fontawesome-free-5.15.2-web/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/css/dmaku.css">
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

        .carousel-item img {
            height: 100%;
            width: 100%;
        }

        .carousel-inner {
            width: 100%;
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

        .card {
            height: 21.125rem;
            padding:5px;
        }

        footer {
            position: relative;
            bottom: 0px;
        }

    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div id="lunbo" class="carousel slide" data-ride="carousel">
    <ul class="carousel-indicators" style="height:720px;overflow:hidden;">
        <li data-target="#lunbo" data-slide-to="0" class="active"></li>
        <li data-target="#lunbo" data-slide-to="1"></li>
        <li data-target="#lunbo" data-slide-to="2"></li>
    </ul>

    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="img-fluid" src="img/4.jpg">
        </div>
        <div class="carousel-item">
            <img class="img-fluid" src="img/2.jpg">
        </div>
        <div class="carousel-item">
            <img class="img-fluid" src="img/3.jpg">
        </div>
    </div>
    <a class="carousel-control-prev" href="#lunbo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#lunbo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>

</div>
<br>
<br>
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


    <ul class="pagination justify-content-center" style="margin-top:80px;margin-bottom:18px">
        <c:choose>
            <c:when test="${now==1}">
                <li class="page-item disabled shadow"><a class="page-link" href="#">Prev</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item shadow"><a class="page-link"
                                                href="${pageContext.request.getContextPath()}/IndexServlet?page=${now-1}">Prev</a>
                </li>
            </c:otherwise>
        </c:choose>
        <c:forEach var="pn" begin="${1}" end="${page}">
            <c:choose>
                <c:when test="${pn==now}">
                    <li class="page-item active shadow"><a class="page-link"
                                                           href="${pageContext.request.getContextPath()}/IndexServlet?page=${pn}">${pn}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item shadow"><a class="page-link"
                                                    href="${pageContext.request.getContextPath()}/IndexServlet?page=${pn}">${pn}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${now==page}">
                <li class="page-item disabled shadow"><a class="page-link" href="#">Next</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item shadow"><a class="page-link"
                                                href="${pageContext.request.getContextPath()}/IndexServlet?page=${now+1}">Next</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
<br>

<div class="fixed-bottom">
    <div id='l-ball' class='ball'>
        <div class='face face-l'>
            <div class='eye eye-l'></div>
            <div class='eye eye-r'></div>
            <div class='mouth'></div>
        </div>
    </div>
    <div id='r-ball' class='ball'>
        <div class='face face-r'>
            <div class='eye eye-l eye-r-p'></div>
            <div class='eye eye-r eye-r-p'></div>
            <div class='mouth mouth-r'></div>
            <div class='kiss-m'>
                <div class='kiss'></div>
                <div class='kiss'></div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
<br>
</body>
</html>