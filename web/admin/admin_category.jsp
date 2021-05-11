<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Title</title>
    <link href="${pageContext.request.getContextPath()}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/fontawesome-free-5.15.2-web/css/all.css" rel="stylesheet">
    <script src="${pageContext.request.getContextPath()}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/popper.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/bootstrap.js"></script>

    <script>
        $(document).ready(function () {
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        })
    </script>

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

        .modal * {
            color: #545f6d;
        }

    </style>
</head>
<body class="bg-dark">
<%@include file="admin_header.jsp" %>

<div class="container rounded shadow mycard">
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#newCate">新建分类</button>

    <table class="table bg-dark table-hover">
        <tr class="text-center">
            <th>ID</th>
            <th>分类</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${list}" var="cate">
        <tr class="text-center">
            <td>${cate.id}</td>
            <td><span class="badge badge-pill badge-secondary">${cate.name}</span></td>
            <td>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalModify" onclick="click7('${cate.id}','${cate.name}')">修改</button>
                <button type="button" class="btn btn-warning" data-toggle="tooltip" title="暂时不支持此操作">删除</button>
            </td>
        </tr>
        </c:forEach>
            <div class="modal fade" id="modalModify">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h4 class="modal-title">修改分类</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <div class="modal-body">
                            <label>ID:</label><span id="spanId"></span><br>
                            <label for="cate_name">分类名称:</label>
                            <input type="text" id="cate_name" class="form-control" name="cate_name">
                        </div>

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" id="sub_btn">
                                <span style="color: rgba(255,255,255,1)">修改</span></button>
                        </div>
                        <script>
                            function click7(id, name) {
                                $("#spanId").text(id);
                                $('#cate_name').val(name);
                                $("#sub_btn").click(function() {
                                    var $name=$("#cate_name").val();
                                    window.location.href = "${pageContext.request.getContextPath()}/admin_modCate?id=" + id + "&cate=" + $name;
                                })
                            }
                        </script>
                    </div>
                </div>
            </div>
    </table>

    <div class="modal fade" id="newCate">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">新建分类</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                        <label for="newcate_name">分类名称:</label>
                        <input type="text" id="newcate_name" class="form-control" name="">
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" onclick="click2()">
                        <span style="color: rgba(255,255,255,1)">新建</span></button>
                </div>
                <script>
                    function click2() {
                        var name = $("#newcate_name").val();
                        window.location.href = '${pageContext.request.getContextPath()}/admin_newCate?cate=' + name;
                    }
                </script>
            </div>
        </div>
    </div>

</div>

</body>
</html>