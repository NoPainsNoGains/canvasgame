var sequence=0;
var circles = [];/*保存所有创建的圆*/
var canvas;
var context;
var recordStack = [];
function initjs(){
	ShowBeforStart();
}

function ShowBeforStart(){
	 document.getElementById("st").style.visibility="visible";
     document.getElementById("bts").style.visibility="hidden";
}

function sleep(d){
	 for(var t = Date.now();Date.now() - t <= d;);
}
	 

function start(){
	document.getElementById("st").style.visibility="hidden ";
    document.getElementById("bts").style.visibility="visible ";
	startOneStep(1,0);
}

function EndGame(s,score){
	reloadTime();
	s=s-1;
	score = score.toFixed(2);
	document.getElementById("st").style.visibility="visible ";
    document.getElementById("bts").style.visibility="hidden ";
    document.getElementById("st").innerHTML="Restart";
	alert("Game over,You pass:"+s+"tests,   The total score:"+score);
	
}

function getbasescore(level){
	if(level==1){
		return 20;
	}else if(level==2){
		return 40;
	}else if(level==3){
		return 50;
	}if(level==4){
		return 100;
	}
}

function startOneStep(s,score){
	if(s>20){
		alert("Congratulations,Mission accomplished !");
		EndGame(s,score); 
		return;
	}else{	
		var level = Getlevel(s);
		var timeLimit = GetTimeLimit(level);
		var baseScore = getbasescore(level);
		var st = (new Date()).getTime();
		/*初始化条件*/
		canvas = document.getElementById("canvas");
		context = canvas.getContext("2d");
		addRandomCircle();//画图
		loadTime(timeLimit*1000);//加载时间
		var meter1 = setTimeout("EndGame("+s+","+score+")", timeLimit*1000);
		canvas.onmouseup = function(ev){//核心处理步骤
		    //1.判断是否在圆内
		    var index= isClickInCircle(ev);
		    if(index!=-1){
		        //2.标记选中的圆
		        recordClickInCircle(ev);
		        //3.绘画
		        decideDraw(ev);
		        //4.合格性判断
		        if(examSequence()==false){
		        	releaseResource();
		        	clearTimeout(meter1);
		        	EndGame(s,score); 
		        }else if(isPass()==true){
		        	releaseResource();
		            s=s+1;
		            clearTimeout(meter1);
		            var et = (new Date()).getTime();
	                score = score+baseScore*(1-(et-st)/(timeLimit*1000));
	                startOneStep(s,score);
		        }
		    }//if
		};//onmouseup
	}//else
}

function Getlevel(step){
	if(1<=step&&step<=5){
		return 1;
	}else if(6<=step&&step<=10){
		return 2;
	}else if(11<=step&&step<=15){
		return 3;
	}else if(16<=step){
		return 4;
	}
}
function GetTimeLimit(level){
	//获取当前等级时间限制
	if(level==1){
		return 30;
	}else if(level==2){
		return 25;
	}else if(level==3){
		return 20;
	}if(level==4){
		return 15;
	}
}
/**********************************************************edit by ymh ********************************************/

/*圆对象*/
function Circle(x, y, radius, color, number) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.color = color;
    this.isSelected = false;
    this.number  = number;
}
/*随机产生from到to范围之间的值*/
function randomFromTo(from, to) {
    return Math.floor(Math.random() * (to - from + 1) + from);
}
/*随机产生圆*/
function addCircle() {
    // 产生随机的坐标和半径.
    var radius =30; //randomFromTo(10, 60);
    var x = randomFromTo(0, canvas.width);//随机定位X坐标0到宽度
    var y = randomFromTo(0, canvas.height);//随机定位Y坐标为0到高度
    // 随机的颜色
    var colors = ["green", "blue", "red", "yellow", "magenta", "orange", "brown", "purple", "pink"];
    var color = colors[randomFromTo(0, 8)];
    // 创建圆
    var circle = new Circle(x, y, radius, color,sequence+1);
    //判断是否重叠
    if(isOverlapping(x, y, radius)==true){
        //判断圆是否在画布之内
        if(isInScreen(x, y, radius)==true){
            // 保存到数组.
            circles.push(circle);
            // 重绘canvas.
            drawCircles();
            sequence++;

        }else{
            addCircle();
        }
    }else{
        addCircle();//重新调用
    }

}
function isOverlapping(x,y,radius){
    for(var i=0;i<circles.length;i++){
        var flag = calculate(circles[i].x,circles[i].y,circles[i].radius,x,y,radius);
        if(flag==false){
            return false;//重叠
        }
    }
    return true;//可以插入
}
function calculate(existX,existY,existR,x,y,radius){
    var distanceX= Math.abs(existX-x);
    var distanceY= Math.abs(existY-y);
    var distanceXY = Math.pow(distanceX,2)+ Math.pow(distanceY,2);
    var distanceR =  Math.abs(existR+radius);
    distanceR = Math.pow(distanceR,2);
    if(distanceXY>distanceR){
        return true;//没有重叠 可以插入
    }else{
        return false;
    }
}
function isInScreen(x,y,radius){
    if( (x>radius)&&(x+radius<canvas.width)&&(y>radius)&&(y+radius<canvas.height) )
        return true;//在画布之内
    else
        return false;
}
/*
 * 判断鼠标的点击是否在圆中
 * */
function isClickInCircle(e){
    //获取鼠标在canvas中点击的位置.
    var clickX = e.pageX - canvas.offsetLeft;
    var clickY = e.pageY - canvas.offsetTop;
    for(var i=circles.length-1; i>=0; i--) {
        var circle = circles[i];
        var distanceFromCenter = Math.sqrt(Math.pow(circle.x - clickX, 2) + Math.pow(circle.y - clickY, 2));
        if (distanceFromCenter <= circle.radius){
            return i;//在圆中 返回圆的下标
        }
    }
    return -1;//不再圆中 返回错误-1
}
/*顺序性检查*/
function examSequence(){
    if(recordStack[0]!=0){
        return false;//点击的不是第一个圆 游戏结束
    }
    for(var i=0;i<recordStack.length-1;i++){
        if( (circles[recordStack[i]].number+1) != circles[recordStack[i+1]].number)
            return false;
    }
    return true;
}
/*通关检测*/
function isPass(){
    if(recordStack.length==circles.length){
        return true;//通关
    }
    return false;
}

/*画圆*/
function drawCircles() {
    context.clearRect(0, 0, canvas.width, canvas.height);
    for(var i=0; i< circles.length; i++) {
        var circle = circles[i];
        context.globalAlpha = 0.85;//调节透明度
        context.beginPath();
        context.arc(circle.x, circle.y, circle.radius, 0, Math.PI*2);
        context.fillStyle = circle.color;
        context.strokeStyle = "black";
        if (circle.isSelected) {
            context.lineWidth = 5;
        }
        else {
            context.lineWidth = 1;
        }
        context.fill();
        context.stroke();
        /*写文字*/
        //在中间写字
        context.font = "bold 20pt Arial";
        context.fillStyle = '#0A0A0A';
        context.textAlign = 'center';
        context.textBaseline = 'middle';
        context.fillText(circles[i].number,  circles[i].x,  circles[i].y);
    }
}
/*画直线*/
function drawLine(previousSelectedCircle,currentSelectCircle){
    if(previousSelectedCircle!=null && currentSelectCircle!=null){
        context.strokeStyle="black";
        context.lineWidth=3;
        context.lineCap="round";
        context.beginPath();
        //定义直线的起点坐标为
        context.moveTo(previousSelectedCircle.x, previousSelectedCircle.y);
        context.lineTo(currentSelectCircle.x, currentSelectCircle.y);
        //沿着坐标点顺序的路径绘制直线
        context.stroke();
        //关闭当前的绘制路径
        context.closePath();
    }
}
/*
 *判断鼠标点击了哪个圆.
 */
function recordClickInCircle(e) {
    var clickX = e.pageX - canvas.offsetLeft;
    var clickY = e.pageY - canvas.offsetTop;
    for(var i=circles.length-1; i>=0; i--) {
        var circle = circles[i];
        var distanceFromCenter = Math.sqrt(Math.pow(circle.x - clickX, 2) + Math.pow(circle.y - clickY, 2));
        if (distanceFromCenter <= circle.radius) {
            circle.isSelected = true;
            if(recordStack[recordStack.length-1]!= (circle.number-1)){//重复点击 去除
                recordStack.push(circle.number-1);//点击的圆放入数组中
            }

        }
    }
}
/*绘制圆*/
function decideDraw(e){
    //1.绘制圆
    drawCircles();
    //2.绘制直线
    for(var i=0;i<recordStack.length-1;i++){
        drawLine(circles[recordStack[i]],circles[recordStack[i+1]]);
    }
}

function releaseResource(){
    document.onmousemove = null;
    document.onmouseup = null;
    document.onmousedown = null;
    sequence=0;
    circles = [];/*保存所有创建的圆*/
    canvas = undefined;
    context = undefined;
    recordStack = [];
}
function addRandomCircle(){
    for(var i=0;i<15;i++){
        addCircle();
    }
}
