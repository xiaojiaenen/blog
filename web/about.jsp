<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>关于我-xiaojia's blog</title>
    <link href="css/scrollbar.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="fontawesome-free-5.15.2-web/css/all.css" rel="stylesheet">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/echarts.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script>
        $(document).ready(function () {

            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.querySelector(".bar1 .chart"));

            var data = [70, 34, 60, 78, 69];
            var titlename = ["HTML5", "CSS3", "javascript", "VUE", "NODE"];
            var valdata = [702, 350, 610, 793, 664];
            var myColor = ["#1089E7", "#F57474", "#56D0E3", "#F8B448", "#8B78F6"];
            option = {
                //图标位置
                grid: {
                    top: "10%",
                    left: "22%",
                    bottom: "10%"
                },
                xAxis: {
                    show: false
                },
                yAxis: [
                    {
                        show: true,
                        data: titlename,
                        inverse: true,
                        axisLine: {
                            show: false
                        },
                        splitLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        },
                        axisLabel: {
                            color: "#000",

                            rich: {
                                lg: {
                                    backgroundColor: "#339911",
                                    color: "#fff",
                                    borderRadius: 15,
                                    // padding: 5,
                                    align: "center",
                                    width: 15,
                                    height: 15
                                }
                            }
                        }
                    },
                    {
                        show: true,
                        inverse: true,
                        data: valdata,
                        axisTick: {
                            show: false
                        },
                        axisLine: {
                            show: false
                        },
                        axisLabel: {
                            textStyle: {
                                fontSize: 12,
                                color: "#000"
                            }
                        }
                    }
                ],
                series: [
                    {
                        name: "条",
                        type: "bar",
                        yAxisIndex: 0,
                        data: data,
                        barCategoryGap: 50,
                        barWidth: 10,
                        itemStyle: {
                            normal: {
                                barBorderRadius: 20,
                                color: function (params) {
                                    var num = myColor.length;
                                    return myColor[params.dataIndex % num];
                                }
                            }
                        },
                        label: {
                            normal: {
                                show: true,
                                position: "inside",
                                formatter: "{c}%"
                            }
                        }
                    },
                    {
                        name: "框",
                        type: "bar",
                        yAxisIndex: 1,
                        barCategoryGap: 50,
                        data: [100, 100, 100, 100, 100],
                        barWidth: 15,
                        itemStyle: {
                            normal: {
                                color: "none",
                                borderColor: "#00c1de",
                                borderWidth: 3,
                                barBorderRadius: 15
                            }
                        }
                    }
                ]
            };
            myChart.setOption(option);
            window.addEventListener("resize", function () {
                myChart.resize();
            });
        });

    </script>
    <style>
        i {
            padding: 3px;
        }

        .navbar {
            height: 45px;
            opacity: .9;
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

        #mycard {
            height: 42.5rem;
            overflow: hidden;
        }

        .container .img-circle {
            position: relative;
            top: -40px;
        }

        .img-circle:hover {
            animation: jump ease-in 2s infinite reverse;
            -webkit-animation: jump ease-in 2s infinite reverse;
        }

        .img-circle {
            /*border: rgba(0,0,0,.3) 1px solid;*/
            height: 70px;
            width: 70px;
            border-radius: 35px;
        }

        @keyframes jump {
            0% {
                top: -40px;
                transform: rotate(0deg);
            }
            50% {
                top: -70px;
            }
            100% {
                top: -40px;
                transform: rotate(360deg);
            }
        }

        @-webkit-keyframes jump {
            0% {
                top: -40px;
                -webkit-transform: rotate(0deg);
            }
            50% {
                top: -70px;
            }
            100% {
                top: -40px;
                -webkit-transform: rotate(360deg);
            }
        }

        .chart {
            height: 11rem;
        }

        #chartcard *{
            color: #5d5d5d;
        }
    </style>
</head>
<body>
<%@include file="header.jsp"%>


<div class="card" id="mycard">
    <img class="card-img-top" src="img/1.jpg">
    <div class="card-img-overlay justify-content-center d-flex">
        <div class="align-self-center">
            <h1 class="card-title text-white">关于我</h1>
        </div>
    </div>
</div>

<div class="container shadow rounded text-center" style="margin-top: 10px;">
    <img class="img-circle shadow" src="img/avatar.jpg">
    <div class="row">
        <div class="col-md-6">
            <div class="card panel bar1 shadow" id="chartcard">
                <p><strong>个人资料：</strong>男，01年，IT男，双鱼座</p>
                <p><strong>爱好：</strong>发呆，听歌，看漫画，吃零食，爱胡思乱想</p>
                <p><strong>个人简介：</strong></p>
                <p>手机控，电脑控，喜欢听许嵩和天依殿下的歌，喜欢看漫画。</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card shadow bar1">
                <strong><p style="color: #5d5d5d">技能掌握</p></strong>
                <div class="chart"></div>
            </div>
        </div>

    </div>
</div>


<br>
<%@include file="footer.jsp"%>
<br>
</body>
</html>