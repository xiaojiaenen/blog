<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Title</title>
    <link href="${pageContext.request.getContextPath()}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/fontawesome-free-5.15.2-web/css/all.css" rel="stylesheet">
    <script src="${pageContext.request.getContextPath()}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/bootstrap.js"></script>
    <style>

        body {
            color: rgba(255, 255, 255, .5);
        }

        table * {
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


    </style>
</head>
<body class="bg-dark">
<%@include file="admin_header.jsp" %>

<div class="container rounded shadow mycard">
    <button type="button" class="btn btn-info"
            onclick="javascript:window.location.href='${pageContext.request.getContextPath()}/admin_newServlet'">
        新建文章
    </button>

    <table class="table bg-dark table-hover">
        <tr class="text-center">
            <th>ID</th>
            <th>标题</th>
            <th>作者</th>
            <th>发布时间</th>
            <th>修改时间</th>
            <th>分类</th>
            <th>标签</th>
            <th>浏览</th>
            <th>点赞</th>
            <th>留言</th>
            <th>操作</th>
        </tr>

        <c:forEach var="bean" items="${list}">
            <tr class="text-center">
                <td>${bean.id}</td>
                <td id="tdId">${bean.title}</td>
                <td>${bean.author}</td>
                <td>${bean.pubdate}</td>
                <td>${bean.moddate}</td>
                <td><span class="badge badge-pill badge-primary">${bean.cateId}</span></td>
                <td>
                    <c:forTokens var="tag" items="${bean.tagId}" delims=" ">
                        <span class="badge badge-pill badge-secondary">${tag}</span>
                    </c:forTokens>
                </td>
                <td>${bean.view}</td>
                <td>${bean.zan}</td>
                <td>${bean.comment}</td>
                <td>
                    <button type="button" class="btn btn-info"
                            onclick="javascript:window.location.href='${pageContext.request.getContextPath()}/admin_modifyServlet?id=${bean.id}'">
                        修改
                    </button>
                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal"
                            onclick="click3('${bean.title}','${bean.id}')">删除</button>
                </td>
            </tr>
        </c:forEach>

        <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content text-black-50">

                        <!-- 模态框头部 -->
                        <div class="modal-header">
                            <h4 class="modal-title">确认删除</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- 模态框主体 -->
                        <div class="modal-body" id="mb">

                        </div>

                        <!-- 模态框底部 -->
                        <div class="modal-footer">
                            <button type="button" id="del" class="btn btn-warning">删除</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        </div>
                        <script>
                            <%--function click4(id) {--%>
                            <%--    window.location.href='${pageContext.request.getContextPath()}/DelServlet?id=${bean.id}--%>
                            <%--}--%>
                            function click3(title,id) {
                                // alert(title)
                                $("#mb").text("你舍得删除"+title+"吗？")
                                $("#del").click(function () {
                                    window.location.href='${pageContext.request.getContextPath()}/admin_delServlet?id='+id
                                })
                                <%--window.location.href='${pageContext.request.getContextPath()}/DelServlet?id=${bean.id}'--%>
                            }

                        </script>

                    </div>
                </div>
            </div>

    </table>


</div>

</body>
</html>