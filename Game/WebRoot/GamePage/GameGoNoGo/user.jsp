<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <html>
        <TITLE>user test main</TITLE>
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
                loop = setInterval(to,timeDistance);//æ¯ä¸åº¦å·æ°ç¾åæ¯å¾
            }
            function reinit(){
                deg=0;
                new_deg=0;
                dif=0;
                clearInterval(loop); 
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
             function loginAdmin(){
	        	  setTimeout(function(){document.location.href="../../userAdmin.jsp";}, 100);
            }
        </script>
</head>
<body style="overflow-y: hidden"> 
     <div class="head" style="height:60px; background:#333;">
    	 <div id="Layer1" style="text-align:right;">
    	 	<a href="javascript:loginAdmin()">
    	 		<font color=white>Record</font>
    	 	</a>
    	 </div>
    </div>
    <div class="body">
        <div class="left">
            <iframe style="background: white" id="gameIframe" class="game" src="gonogo.jsp"  scrolling="no" ></iframe>
        </div>
        <div class="right">
             <div class="ru">
                 <p style="background: black;color: white ; text-align: center;font-size: 30px" >Time</p>
             <canvas  id="canvas" height="300"  ></canvas>
             </div>
             <div class="rd" style="overflow:scroll;overflow-x: hidden">
                <p style="background: black;color: white ; text-align: center;font-size: 30px" >Direction:</p>
            		<p style="background: black;color: white ; text-align: justify;font-size: 18px;" >
						Subjects are asked to respond and pick the correct choice, based on which label is filled with green color ’go’, while the other label is blank. However, one of the label is colored red, which is a signal not to respond at all ‘no- go
						When you see the green label on the left, you should press the key”<”on the keyboard. When you see the green on the right you should press the key “>” on the keyboard. However when you see the red label, do not press anything.
						Each level can be completed within the stipulated time to cross the test, or a timeout error will fail. A total of 20 off the game, four difficulty levels, and time were 5s, 3s, 2s, 1s.

					</p>
             </div>
        </div>
    </div>

</body>
</html>