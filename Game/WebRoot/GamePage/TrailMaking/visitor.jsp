<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
        <TITLE>Trail Making</TITLE>
        <meta name="description" content="." />

        <style>
            *{margin:0px; padding:0px;}
            .head,.body,.footer{margin:0px auto; width:100%;}
            .left{ height:800px;width:70%; background:white; float:left;}
            .game{width:100%; height:100%;  float:left;}
            .right{ height:800px; width:30%; float:left;}
            .ru{width:100%; height:50%; background:black; float:left;}

            .rd{width:100%; height:50%; background:black; float:left;}
            
            #canvas{display:block; margin-left:50px;  margin-bottom:800px ; background:black;}
            #Layer1 {
				position:fixed;
				width:150px;
				height:25px;
				z-index:1;
				left: 87%;
				top: 3%;
				color: #ffffff;
			}
        </style>
        <script type="text/javascript">
            var W ;
            var H ;
            var ctx;
            var canvas;
            var deg=0,new_deg=0,dif=0;
            var loop,re_loop;
            var text,text_w;
            //var time = 10000;
            function reloadTime(time){
                canvas = document.getElementById("canvas");
                ctx = canvas.getContext("2d");
                W = canvas.width;
                H = canvas.height;
                reinit();
                draw(time);
            };
            window.onload = function(){
            	canvas = document.getElementById("canvas");
                ctx = canvas.getContext("2d");
                W = canvas.width;
                H = canvas.height;
                init();
            };
            function draw(time){
                new_deg =361;//361è¡¨ç¤º100%
                dif = new_deg-deg;
                console.log(new_deg);
                console.log(deg);//DEG 0
                console.log(dif);//DEG 0
                var timeDistance = time/dif;
                loop = setInterval(to,timeDistance);
            }
            function reinit(){
                deg=0;
                new_deg=0;
                dif=0;
                clearInterval(loop);//æ¸é¤å½æ°
                init();
            }
            function to(){
                if(deg == new_deg){
                    clearInterval(loop);//æ¸é¤å½æ°
                }
                if(deg<new_deg){
                    deg++;
                }else{
                    deg--;
                }
                init();
            }
            function init(){
                ctx.clearRect(0,0,W,H);
                ctx.beginPath();
                ctx.strokeStyle="#F4F4F4";//æ»å¨æ¡èæ¯é¢è²
                ctx.lineWidth=30;
                ctx.arc(W/2,H/2,100,0,Math.PI*2,false);
                ctx.stroke();

                var r = deg*Math.PI/180;
                ctx.beginPath();
                ctx.strokeStyle = "#EE6363";//æ»å¨æ¡é¢è²
                ctx.lineWidth=30;
                ctx.arc(W/2,H/2,100,0-90*Math.PI/180,r-90*Math.PI/180,false);
                ctx.stroke();

                ctx.fillStyle="#EE6363";//ç¾åæ¯é¢è²
                ctx.font="50px abc";
                text = Math.floor(deg/360*100)+"%";//ç¾åæ¯
                text_w = ctx.measureText(text).width;
                ctx.fillText(text,W/2 - text_w/2,H/2+15);
            }
            function login(){
   			     setTimeout(function(){document.location.href="../../login.jsp";}, 4000);
            }
        </script>
</head>
<body style="overflow-y: hidden"> 
    <div class="head" style="height:60px; background:#333;">
    	 <div id="Layer1" style="text-align:right;">
    	 	<a href="javascript:login()">
    	 		<font color=white>Login</font>
    	 	</a>
    	 </div>
    </div>
    <div class="body">
        <div class="left">
            <iframe style="background: white" id="gameIframe" class="game" src="TrailMakingVisitor.jsp"  scrolling="no" ></iframe>
        </div>
        <div class="right">
             <div class="ru">
                 <p style="background: black;color: white ; text-align: center;font-size: 30px" >Time</p>
             <canvas  id="canvas" height="300"  ></canvas>
             </div>
             <div class="rd" style="overflow:scroll;overflow-x: hidden">
                <p style="background: black;color: white ; text-align: center;font-size: 30px" >Direction:</p>
            		<p style="background: black;color: white ; text-align: justify;font-size: 18px;" >
						Users click the Start button and the system generates a random 15 numbers on a page, the number range from 1-15, so long as the order number of the connection can pass.
If the wrong order, the game will end. It will display past the number and total number of points off after the end of the game. A total of 20 levels, each level 5 is a difficulty level. System time will be gradually reduced, the difficulty is increasing when pass a level.
Also note that, so long as sequence error appeared, it will immediately stop the game.
						</p>
             </div>
        </div>
    </div>

</body>
</html>