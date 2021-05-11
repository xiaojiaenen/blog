<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>管理员登录-xiaojia's blog</title>
    <link href="${pageContext.request.getContextPath()}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/fontawesome-free-5.15.2-web/css/all.css" rel="stylesheet">
    <script src="${pageContext.request.getContextPath()}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/js/bootstrap.js"></script>

    <style>
        .card{
            height: 350px;
            width: 430px;
            padding: 10px;
            position:absolute;
            left:0;
            top: 0;
            bottom: 0;
            right: 0;
            margin: auto;
        }
        form *{
            margin: 8px;
        }
        form input[type='submit']{
            width: 120px;
            color: #fff;
            background: #4797ED;
        }

        form input[type='submit']:hover{
            background: #d8d8d8;
            color: #666;
        }
        form input[type='text']{
            width: 240px;
        }

        form input[type='password']{
            width: 240px;
        }

         body {
             background: #000;
             margin: 0;
         }

        canvas {
            cursor: crosshair;
            display: block;
            position: relative;
            z-index: -2;
        }
    </style>
</head>
<body>


<canvas id="canvas"></canvas>

<script>
    // when animating on canvas, it is best to use requestAnimationFrame instead of setTimeout or setInterval
    // not supported in all browsers though and sometimes needs a prefix, so we need a shim
    window.requestAnimFrame = ( function() {
        return window.requestAnimationFrame ||
            window.webkitRequestAnimationFrame ||
            window.mozRequestAnimationFrame ||
            function( callback ) {
                window.setTimeout( callback, 1000 / 60 );
            };
    })();

    // now we will setup our basic variables for the demo
    var canvas = document.getElementById( 'canvas' ),
        ctx = canvas.getContext( '2d' ),
        // full screen dimensions
        cw = window.innerWidth,
        ch = window.innerHeight,
        // firework collection
        fireworks = [],
        // particle collection
        particles = [],
        // starting hue
        hue = 120,
        // when launching fireworks with a click, too many get launched at once without a limiter, one launch per 5 loop ticks
        limiterTotal = 5,
        limiterTick = 0,
        // this will time the auto launches of fireworks, one launch per 80 loop ticks
        timerTotal = 80,
        timerTick = 0,
        mousedown = false,
        // mouse x coordinate,
        mx,
        // mouse y coordinate
        my;

    // set canvas dimensions
    canvas.width = cw;
    canvas.height = ch;

    // now we are going to setup our function placeholders for the entire demo

    // get a random number within a range
    function random( min, max ) {
        return Math.random() * ( max - min ) + min;
    }

    // calculate the distance between two points
    function calculateDistance( p1x, p1y, p2x, p2y ) {
        var xDistance = p1x - p2x,
            yDistance = p1y - p2y;
        return Math.sqrt( Math.pow( xDistance, 2 ) + Math.pow( yDistance, 2 ) );
    }

    // create firework
    function Firework( sx, sy, tx, ty ) {
        // actual coordinates
        this.x = sx;
        this.y = sy;
        // starting coordinates
        this.sx = sx;
        this.sy = sy;
        // target coordinates
        this.tx = tx;
        this.ty = ty;
        // distance from starting point to target
        this.distanceToTarget = calculateDistance( sx, sy, tx, ty );
        this.distanceTraveled = 0;
        // track the past coordinates of each firework to create a trail effect, increase the coordinate count to create more prominent trails
        this.coordinates = [];
        this.coordinateCount = 3;
        // populate initial coordinate collection with the current coordinates
        while( this.coordinateCount-- ) {
            this.coordinates.push( [ this.x, this.y ] );
        }
        this.angle = Math.atan2( ty - sy, tx - sx );
        this.speed = 2;
        this.acceleration = 1.05;
        this.brightness = random( 50, 70 );
        // circle target indicator radius
        this.targetRadius = 1;
    }

    // update firework
    Firework.prototype.update = function( index ) {
        // remove last item in coordinates array
        this.coordinates.pop();
        // add current coordinates to the start of the array
        this.coordinates.unshift( [ this.x, this.y ] );

        // cycle the circle target indicator radius
        if( this.targetRadius < 8 ) {
            this.targetRadius += 0.3;
        } else {
            this.targetRadius = 1;
        }

        // speed up the firework
        this.speed *= this.acceleration;

        // get the current velocities based on angle and speed
        var vx = Math.cos( this.angle ) * this.speed,
            vy = Math.sin( this.angle ) * this.speed;
        // how far will the firework have traveled with velocities applied?
        this.distanceTraveled = calculateDistance( this.sx, this.sy, this.x + vx, this.y + vy );

        // if the distance traveled, including velocities, is greater than the initial distance to the target, then the target has been reached
        if( this.distanceTraveled >= this.distanceToTarget ) {
            createParticles( this.tx, this.ty );
            // remove the firework, use the index passed into the update function to determine which to remove
            fireworks.splice( index, 1 );
        } else {
            // target not reached, keep traveling
            this.x += vx;
            this.y += vy;
        }
    }

    // draw firework
    Firework.prototype.draw = function() {
        ctx.beginPath();
        // move to the last tracked coordinate in the set, then draw a line to the current x and y
        ctx.moveTo( this.coordinates[ this.coordinates.length - 1][ 0 ], this.coordinates[ this.coordinates.length - 1][ 1 ] );
        ctx.lineTo( this.x, this.y );
        ctx.strokeStyle = 'hsl(' + hue + ', 100%, ' + this.brightness + '%)';
        ctx.stroke();

        ctx.beginPath();
        // draw the target for this firework with a pulsing circle
        ctx.arc( this.tx, this.ty, this.targetRadius, 0, Math.PI * 2 );
        ctx.stroke();
    }

    // create particle
    function Particle( x, y ) {
        this.x = x;
        this.y = y;
        // track the past coordinates of each particle to create a trail effect, increase the coordinate count to create more prominent trails
        this.coordinates = [];
        this.coordinateCount = 5;
        while( this.coordinateCount-- ) {
            this.coordinates.push( [ this.x, this.y ] );
        }
        // set a random angle in all possible directions, in radians
        this.angle = random( 0, Math.PI * 2 );
        this.speed = random( 1, 10 );
        // friction will slow the particle down
        this.friction = 0.95;
        // gravity will be applied and pull the particle down
        this.gravity = 1;
        // set the hue to a random number +-20 of the overall hue variable
        this.hue = random( hue - 20, hue + 20 );
        this.brightness = random( 50, 80 );
        this.alpha = 1;
        // set how fast the particle fades out
        this.decay = random( 0.015, 0.03 );
    }

    // update particle
    Particle.prototype.update = function( index ) {
        // remove last item in coordinates array
        this.coordinates.pop();
        // add current coordinates to the start of the array
        this.coordinates.unshift( [ this.x, this.y ] );
        // slow down the particle
        this.speed *= this.friction;
        // apply velocity
        this.x += Math.cos( this.angle ) * this.speed;
        this.y += Math.sin( this.angle ) * this.speed + this.gravity;
        // fade out the particle
        this.alpha -= this.decay;

        // remove the particle once the alpha is low enough, based on the passed in index
        if( this.alpha <= this.decay ) {
            particles.splice( index, 1 );
        }
    }



    // draw particle
    Particle.prototype.draw = function() {

        ctx. beginPath();
        // move to the last tracked coordinates in the set, then draw a line to the current x and y
        ctx.moveTo( this.coordinates[ this.coordinates.length - 1 ][ 0 ], this.coordinates[ this.coordinates.length - 1 ][ 1 ] );
        ctx.lineTo( this.x, this.y );
        ctx.strokeStyle = 'hsla(' + this.hue + ', 100%, ' + this.brightness + '%, ' + this.alpha + ')';
        ctx.stroke();


    }

    // create particle group/explosion
    function createParticles( x, y ) {
        // increase the particle count for a bigger explosion, beware of the canvas performance hit with the increased particles though
        var particleCount = 30;
        while( particleCount-- ) {
            particles.push( new Particle( x, y ) );
        }
    }

    // main demo loop
    function loop() {
        // this function will run endlessly with requestAnimationFrame
        requestAnimFrame( loop );

        // increase the hue to get different colored fireworks over time
        hue += 0.5;

        // normally, clearRect() would be used to clear the canvas
        // we want to create a trailing effect though
        // setting the composite operation to destination-out will allow us to clear the canvas at a specific opacity, rather than wiping it entirely
        ctx.globalCompositeOperation = 'destination-out';
        // decrease the alpha property to create more prominent trails
        ctx.fillStyle = 'rgba(0, 0, 0, 0.5)';
        ctx.fillRect( 0, 0, cw, ch );
        // change the composite operation back to our main mode
        // lighter creates bright highlight points as the fireworks and particles overlap each other
        ctx.globalCompositeOperation = 'lighter';

        var text = "WELCOME TO XIAOJIA'S BLOG !!";
        ctx.font = "50px sans-serif";
        var textData = ctx.measureText(text);
        ctx.fillStyle = "rgba("+parseInt(random(0,255))+","+parseInt(random(0,255))+","+parseInt(random(0,255))+",0.3)";
        ctx.fillText(text,cw /2-textData.width/2,ch-50);

        // loop over each firework, draw it, update it
        var i = fireworks.length;
        while( i-- ) {
            fireworks[ i ].draw();
            fireworks[ i ].update( i );
        }

        // loop over each particle, draw it, update it
        var i = particles.length;
        while( i-- ) {
            particles[ i ].draw();
            particles[ i ].update( i );
        }

        // launch fireworks automatically to random coordinates, when the mouse isn't down
        if( timerTick >= timerTotal ) {
            if( !mousedown ) {
                // start the firework at the bottom middle of the screen, then set the random target coordinates, the random y coordinates will be set within the range of the top half of the screen

                for(var h=0;h<50;h++)
                {
                    fireworks.push( new Firework( cw / 2, ch/2, random( 0, cw ), random( 0, ch  ) ) );
                }


                timerTick = 0;
            }
        } else {
            timerTick++;
        }

        // limit the rate at which fireworks get launched when mouse is down
        if( limiterTick >= limiterTotal ) {
            if( mousedown ) {
                // start the firework at the bottom middle of the screen, then set the current mouse coordinates as the target
                fireworks.push( new Firework( cw / 2, ch/2, mx, my ) );
                limiterTick = 0;
            }
        } else {
            limiterTick++;
        }
    }

    // mouse event bindings
    // update the mouse coordinates on mousemove
    canvas.addEventListener( 'mousemove', function( e ) {
        mx = e.pageX - canvas.offsetLeft;
        my = e.pageY - canvas.offsetTop;
    });

    // toggle mousedown state and prevent canvas from being selected
    canvas.addEventListener( 'mousedown', function( e ) {
        e.preventDefault();
        mousedown = true;
    });

    canvas.addEventListener( 'mouseup', function( e ) {
        e.preventDefault();
        mousedown = false;
    });

    // once the window loads, we are ready for some fireworks!
    window.onload = loop;

</script>
<script src="${pageContext.request.getContextPath()}/js/login.js"></script>


<div class="container">
    <div class="card shadow bg-light rounded">
        <form class="form-group align-self-center justify-content-center" action="${pageContext.request.getContextPath()}/LoginServlet" method="post">
            <h5 class="text-center">后台管理员登录</h5>
            <label for="user">UserName:</label><input class="form-control" id="user" type="text" name="user" placeholder="Enter UserName">
            <label for="pwd">PassWord:</label><input class="form-control" id="pwd" type="password" name="pwd" placeholder="Enter PassWord">
            <input class="form-control rounded m-auto" type="submit" id="myform" value="登录">
        </form>
    </div>
</div>

<script>
    $(function () {
        // 定义开关变量
        var flagUser=false
        var flagPwd=false

        // 找到所在标签元素
        var $user_name = $('#user')
        var $pwd=$('#pwd')
        var $submit=$('#myform')

        // 1.如果失去焦点，则进行检查判断用户名是否合法
        // $user_name.blur(function () {
        //     // 封装函数 调用函数
        //     fnCheckUser()
        // })
        function fnCheckUser() {
            // 获取用户输入的数据
            var vals = $user_name.val()
            // 正则，正则验证用户输入的数据是否合法
            var re = /^\w{6,20}$/

            if (vals == '') {
                // $user_name.next().show().html('用户名不能为空')
                alert("用户名不能为空");
                flagUser=false
                return;
            }
            if (re.test(vals)) {
                // 合法 -- 隐藏报错信息
                // $user_name.next().hide()
                flagUser=true;
            } else {
                // 不合法 -- 报错 -- 下面的span标签显示
                $user_name.next().show().html('用户名是6-20位数字、字母和下划线！');
                flagUser=false;
                alert('用户名是6-20位数字、字母和下划线！');
            }
        }

        // 2.如果密码框失去焦点，则进行检查判断密码是否合法
        // $pwd.blur(function(){
        //     // 封装函数，调用函数
        //     fnCheckPwd()
        // })
        function fnCheckPwd(){
            // 获取密码框输入的数据
            var vals=$pwd.val()
            // 密码正则匹配表达式
            var rePass = /^[\w!-@#$%^&*]{6,20}$/
            // 如果输入框为空，则提示不能为空并return
            if (vals===''){
                // $pwd.next().show().html('密码不能为空')
                flagPwd=false
                alert('密码不能为空');
                return;
            }
            // 正则验证密码输入是否合法
            if(rePass.test(vals))
            {
                // 如果匹配成功，则隐藏span标签
                // $pwd.next().hide()
                flagPwd=true
            }
            else
            {
                // 如果匹配失败，则显示span标签，替换提示信息
                // $pwd.next().show().html('密码是6到20位字母、数字，还可包含@!#$%^&*-字符')
                flagPwd=false;
                alert('密码是6到20位字母、数字，还可包含@!#$%^&*-字符');
            }
        }
        $submit.submit(function(){
            fnCheckUser();
            fnCheckPwd();
        })
    })
</script>

</body>
</html>