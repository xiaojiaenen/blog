<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Title</title>
    <link href="${pageContext.request.getContextPath()}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/editormd/css/editormd.css"/>
    <link href="${pageContext.request.getContextPath()}/fontawesome-free-5.15.2-web/css/all.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/css/editor_dark.css" rel="stylesheet">
    <script src="${pageContext.request.getContextPath()}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/bootstrap.js"></script>
    <script src="${pageContext.request.getContextPath()}/editormd/editormd.js"></script>

    <style>

        body {
            color: rgba(255, 255, 255, .5);
        }

        i {
            padding: 3px;
        }

        .navbar {
            width: 195px;
        }

        .my_navbar {
            margin-right: 15px;
        }

        .navbar li {
            margin-bottom: 15px;
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

        .mycard {
            margin-top: 30px;
        }

        .form-group input {
            margin: 10px;
        }


    </style>
</head>
<body class="bg-dark">
<nav class="navbar bg-dark navbar-dark float-left fixed-top">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
        <ul class="navbar-nav my_navbar">
            <li class="nav-item">
                <a href="${pageContext.request.getContextPath()}/IndexServlet" class="navbar-brand"
                   style="color: rgba(255,255,255,.5);"><strong>xiaojia's
                    blog</strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.getContextPath()}/admin/admin_index.jsp"><i
                        class="fas fa-home"></i>??????</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.getContextPath()}/admin_articleServlet"><i
                        class="far fa-clipboard"></i>????????????</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.getContextPath()}/admin_cateServlet"
                   data-toggle="dropdown"><i class="fas fa-th-large"></i>????????????</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.getContextPath()}/admin_tagServlet"><i
                        class="fas fa-tags"></i>????????????</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-user"></i>??????</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container rounded shadow mycard">
    <form class="form-group" method="post" action="${pageContext.request.getContextPath()}/admin/admin_jump.jsp">
        <label>??????:</label>
        <input class="form-control" type="text" id="title" placeholder="??????">
        <label>??????:</label>
        <select id="cate" class="form-control">
            <c:forEach var="c" items="${list}">
                <option>${c.name}</option>
            </c:forEach>
        </select>
        <label>??????:</label><input class="form-control" type="text" id="tags" placeholder="????????????????????????3???">
        <div id="test-editormd">
            <textarea style="display:none;" class="form-control" id="editormd" name="editormd"></textarea>
            <textarea class="editormd-html-textarea" name="text" id="editormdData"></textarea>
        </div>
        <!--        <label>??????:</label>-->
        <!--        <textarea name="content" class="rounded" style="height: 600px;width: 100%;"></textarea>-->
        <input name="sub" type="submit" class="form-control" id="saveBtn" value="????????????">
    </form>

    <script>
        var testEditor;
        $(function () {//Editor????????????
            testEditor = editormd("test-editormd", {
                width: "90%",
                height: 640,
                syncScrolling: "single",
                // theme : "dark",
                path: "${pageContext.request.getContextPath()}/editormd/lib/", //??????lib???????????????
                //????????????????????????????????????HTML?????????????????????????????????textarea???????????????post????????????
                // saveHTMLToTextarea : true, // ?????? HTML ??? Textarea???true???????????????html???????????????????????????????????????
                toolbarAutoFixed: true,//?????????????????????????????????????????????
                imageUpload: true,
                imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL: "${pageContext.request.getContextPath()}/upload",
            });
            $("#saveBtn").click(function () {
                var data = $("#editormdData").val();
                var title = $("#title").val();
                var cate = $("#cate").val();
                var tags = $("#tags").val();
                var datas = {'data': data, 'title': title, 'cate': cate, 'tags': tags};
                // alert(JSON.stringify(datas));
                $.ajax({
                    data: datas,
                    dataType: 'json',
                    type: 'post',
                    url: '${pageContext.request.contextPath}/admin_saveData',
                    success: function (msg) {
                        alert(msg);
                    }
                })
            });
        });
    </script>
    <!--    <button id="saveBtn">????????????</button>-->

</div>
</body>
</html>