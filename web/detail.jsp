<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${article.title}-xiaojia's blog</title>
    <link href="${pageContext.request.getContextPath()}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/fontawesome-free-5.15.2-web/css/all.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/css/detail.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/css/editor_dark.css" rel="stylesheet">

    <script src="${pageContext.request.getContextPath()}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/popper.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/bootstrap.js"></script>
    <%--    <script charset="utf-8" src="${pageContext.request.getContextPath()}/js/detail.js"></script>--%>

    <script src="${pageContext.request.getContextPath()}/editormd/lib/marked.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/editormd/lib/prettify.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/editormd/lib/raphael.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/editormd/lib/underscore.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/editormd/lib/sequence-diagram.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/editormd/lib/flowchart.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/editormd/lib/jquery.flowchart.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/editormd/editormd.js"></script>
    <script>
        $(document).ready(function () {
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        })
    </script>
    <script charset="UTF-8">

        $(document).ready(function () {
            var wordsView;
            wordsView = editormd.markdownToHTML("wordsView", {
                htmlDecode: "style,script,iframe",  // you can filter tags decode
                emoji: true,
                taskList: true,
                tex: true,  // 默认不解析
                flowChart: true,  // 默认不解析
                sequenceDiagram: true,  // 默认不解析
            });


            // var count=0;


            $('[data-toggle="popover"]').popover({
                animation: true,
                trigger: 'hover',//鼠标以上时触发弹出提示框
                html: true,//开启html 为true的话，data-content里就能放html代码了
                content: "<strong><span>支付宝</span></strong><img src='img/alipay.png' class='img-thumbnail'>" +
                    "<strong><span>微信</span></strong><img src='img/wechat.png' class='img-thumbnail'>"
            });

            $(window).scroll(function () {
                var scrollTo = $(window).scrollTop(),
                    docHeight = $(document).height(),
                    windowHeight = $(window).height();


                scrollPercent = (scrollTo / docHeight) * 100;
                scrollPercentscrollPercent = scrollPercent.toFixed(1);


            }).trigger('scroll');
            var cnt = document.getElementById("count");
            var water = document.getElementById("water");
            var interval;
            cnt.innerHTML = scrollPercentscrollPercent;
            interval = setInterval(function () {
                cnt.innerHTML = scrollPercentscrollPercent;
                water.style.transform = 'translate(0' + ',' + (100 - scrollPercentscrollPercent) + '%)';
            }, 60);
        });
    </script>
</head>
<body>
<%@include file="header.jsp" %>


<div class="card">
    <img class="card-img-top" src="${pageContext.request.getContextPath()}/img/${article.img}.jpg">
    <div class="card-img-overlay justify-content-center d-flex">
        <div class="align-self-center">
            <h1 class="card-title text-white">${article.title}</h1>
            <small><i class="fas fa-feather-alt"></i><a href="#">${article.author}</a></small>
            <small><i class="far fa-calendar-alt"></i><a href="#">${article.pubdate}</a></small><br>
            <small><i class="fas fa-th-large"></i><a href="#">${article.cateId}</a></small>
            <small><i class="fas fa-tags"></i><a href="#">${article.tagId}</a></small>
            <small><i class="far fa-eye"></i><span>${article.view}&nbsp;次</span></small>
        </div>
    </div>
</div>


<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
     style="display: none;">
    <symbol id="wave">
        <path d="M420,20c21.5-0.4,38.8-2.5,51.1-4.5c13.4-2.2,26.5-5.2,27.3-5.4C514,6.5,518,4.7,528.5,2.7c7.1-1.3,17.9-2.8,31.5-2.7c0,0,0,0,0,0v20H420z"></path>
        <path d="M420,20c-21.5-0.4-38.8-2.5-51.1-4.5c-13.4-2.2-26.5-5.2-27.3-5.4C326,6.5,322,4.7,311.5,2.7C304.3,1.4,293.6-0.1,280,0c0,0,0,0,0,0v20H420z"></path>
        <path d="M140,20c21.5-0.4,38.8-2.5,51.1-4.5c13.4-2.2,26.5-5.2,27.3-5.4C234,6.5,238,4.7,248.5,2.7c7.1-1.3,17.9-2.8,31.5-2.7c0,0,0,0,0,0v20H140z"></path>
        <path d="M140,20c-21.5-0.4-38.8-2.5-51.1-4.5c-13.4-2.2-26.5-5.2-27.3-5.4C46,6.5,42,4.7,31.5,2.7C24.3,1.4,13.6-0.1,0,0c0,0,0,0,0,0l0,20H140z"></path>
    </symbol>
</svg>
<div class="box">
    <div class="percent">
        <div class="percentNum" id="count">0</div>
        <div class="percentB">%</div>
    </div>
    <div id="water" class="water">
        <svg viewBox="0 0 560 20" class="water_wave water_wave_back">
            <use xlink:href="#wave"></use>
        </svg>
        <svg viewBox="0 0 560 20" class="water_wave water_wave_front">
            <use xlink:href="#wave"></use>
        </svg>
    </div>
</div>

<div style="margin-top: 20px;padding: 20px" class="container shadow" id="wordsView">
    <div class="alert alert-primary" style="width: 50%;margin: 8px">
        <strong>本文最后更新于：${article.moddate}</strong>
    </div>
    <textarea style="display:none; padding: 5px" name="editormd-markdown-doc">${article.content}</textarea>

</div>

<div class="container text-center" style="margin-top: 15px;">
    <button class="btn btn-circle shadow" style="margin-right: 8px;" onclick="zanCount()"><span><strong
            id="zan">赞&nbsp;${article.zan}</strong></span></button>
    <button type="button" class="btn btn-circle shadow" data-container="body" data-toggle="popover"
            data-placement="top"><strong>赏</strong></button>
</div>
<script>
    function zanCount() {
        $.ajax({
            url: "${pageContext.request.getContextPath()}/ZanServlet",
            type:"get",
            data:{"id":"${article.id}"},
            success: function (data) {
                $('#zan').text("");
                $('#zan').text("赞 " + data);
            },
            error:function (){
                alert("error")
            }
        });
        // count += 1;
        // $('#zan').text("赞 " + count);
    };
</script>

<div id="qq" class="shadow">
    <p>有什么新鲜事想告诉大家?</p>
    <div id="msg" class="message" contentEditable='true'></div>
    <div class="But">
        <i class="fab fa-markdown bq"></i>
<%--        <i class='bq'>--%>
        <span class='submit' id="submit">发表</span>
    </div>
</div>

<script>
    $('#submit').click(function (){
        var content=$("#msg").html();
        if(content!=""){
        $.ajax({
            url:"CommentServlet",
            type: "get",
            data:{"data":content,"id":'${article.id}'},
            success:function (){
                location.reload();
            }
        });
        }
    });
    function del(id){
        $.ajax({
            url:"DelCommentServlet",
            type: "get",
            data:{"id":id},
            success:function (){
                location.reload();
            }
        });
    }
</script>


<div class="msgCon shadow">
    <c:forEach items="${list}" var="l">
    <div class='msgBox'>
        <div class="headUrl">
            <img class="shadow img-circle" src='img/touxiang/${l.img}.jpg' width='50' height='50'>
            <div>
                <span class="title">${l.name}</span>
                <span class="time">${l.date}</span>
            </div>
            <c:if test="${sessionScope.isLogin=='true'}">
                <a class="del" id="del" onclick="del('${l.id}')">删除</a>
            </c:if>
        </div>
        <div class='msgTxt' id="${l.id}">
            <textarea style="display:none; padding: 5px" name="editormd-markdown-doc">${l.content}</textarea>
        </div>
    </div>
        <script>
        var comment;
        comment = editormd.markdownToHTML("${l.id}", {
        htmlDecode: "style,script,iframe",  // you can filter tags decode
        emoji: true,
        taskList: true,
        tex: true,  // 默认不解析
        flowChart: true,  // 默认不解析
        sequenceDiagram: true,  // 默认不解析
        });
        </script>
    </c:forEach>
</div>

<br>
<%@include file="footer.jsp"%><br>
</body>
</html>