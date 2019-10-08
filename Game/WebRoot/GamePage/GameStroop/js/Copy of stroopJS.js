/**
 * 
 */
function initjs(){
	ShowBeforStart();
}

function ShowBeforStart(){
	 document.getElementById("st").style.visibility="visible";
     document.getElementById("word").style.visibility="hidden";
     document.getElementById("bts").style.visibility="hidden";
}

function sleep(d){
	  for(var t = Date.now();Date.now() - t <= d;);
	}
	 

function start(){
	document.getElementById("st").style.visibility="hidden ";
    document.getElementById("word").style.visibility="visible ";
    document.getElementById("bts").style.visibility="visible ";
	startOneStep(1);
}

function GetShow()
{
var Rangew = 5 - 1;   
var Randw = Math.random();   
var w = 1+Math.round(Randw * Rangew);
	switch (w){
	case 1:
		document.getElementById("word").innerHTML="black";;
		break;
	case 2:
		document.getElementById("word").innerHTML="blue";
		break;
	case 3:
		document.getElementById("word").innerHTML="yellow ";
		break;
	case 4:
		document.getElementById("word").innerHTML="green ";
		break;
	case 5:
		document.getElementById("word").innerHTML="red ";
		break;
	}
var Range = 5 - 1;   
var Rand = Math.random();   
var color = 1+Math.round(Rand * Range);
	switch (color){
	case 1:
		document.getElementById("word").style.color="black";
		break;
	case 2:
		document.getElementById("word").style.color="blue";
		break;
	case 3:
		document.getElementById("word").style.color="yellow";
		break;
	case 4:
		document.getElementById("word").style.color="green";
		break;
	case 5:
		document.getElementById("word").style.color="red";
		break;
	}
	
	return document.getElementById("word").style.color;
}   
function EndGame(s){
	reloadTime();
	s=s-1;
	if(s<=5){
		socor = s*5;
	}else if(s<=10){
		socor = 25+(s-5)*10;
	}else if(s<=15){
		socor = 75+(s-10)*20;
	}else if(s<=20){
		socor = 175+(s-15)*50;
	}
	document.getElementById("st").style.visibility="visible ";
    document.getElementById("word").style.visibility="hidden ";
    document.getElementById("bts").style.visibility="hidden ";
    document.getElementById("st").innerHTML="Restart";
	alert("游戏结束，恭喜你一共闯过了"+s+"关，获得了 "+socor+ "分！")
}
function startOneStep(s){
	document.getElementById("r6").checked="checked";
	if(s>20){
		alert(" 通 关！");
		EndGame(s); 
		return;
	}else {
		var level = Getlevel(s);
		var timeLimit = GetTimeLimit(level);
		loadTime(timeLimit*1000);
		var color = GetShow();
		var meter1 = setTimeout("EndGame("+s+")", timeLimit*1000);
		onmousedown = function(event){
			event = event? event: window.event
			var obj = event.srcElement ? event.srcElement:event.target;
			if(obj.id=="black"){
                clearTimeout(meter1);
                if(color=="black"){
                s=s+1;
                startOneStep(s);
                }else EndGame(s);
           }else if(obj.id=="blue"){
                clearTimeout(meter1);
                if(color=="blue"){
                s=s+1;
                startOneStep(s)
                }else EndGame(s);
           }else if(obj.id=="yellow"){
                clearTimeout(meter1);
                if(color=="yellow"){
                s=s+1;
                startOneStep(s)
                }else EndGame(s);
           }else if(obj.id=="green"){
                clearTimeout(meter1);
                if(color=="green"){
                s=s+1;
                startOneStep(s)
                }else EndGame(s);
           }else if(obj.id=="red"){
                clearTimeout(meter1);
                if(color=="red"){
                s=s+1;
                startOneStep(s)
                }else EndGame(s);
            }
		}
	}
}

function GetTimeLimit(level){
	//获取当前等级时间限制
	if(level==1){
		return 5;
	}else if(level==2){
		return 3;
	}else if(level==3){
		return 2;
	}if(level==4){
		return 1;
	}
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

function b1(){
    document.getElementById("r1").checked="checked";
    document.getElementById("black").style.fontSize= "30px";
}
function b2(){
    document.getElementById("r2").checked="checked";
    document.getElementById("blue").style.fontSize= "30px";
}
function b3(){
    document.getElementById("r3").checked="checked";
    document.getElementById("yellow").style.fontSize= "30px";
}
function b4(){
    document.getElementById("r4").checked="checked";
    document.getElementById("green").style.fontSize= "30px";
}
function b5(){
	var obj = window.event?event.srcElement:evt.target;
	alert(obj.id);
    document.getElementById("r5").checked="checked";
    document.getElementById("red").style.fontSize= "30px";
}

function clearradio(){                           //取消radio的选择
    var x=document.getElementsByName("ra");  //获取所有name=brand的元素
    for(var i=0;i<x.length;i++){ //对所有结果进行遍历，如果状态是被选中的，则将其选择取消
        if (x[i].checked==true)
        {
            x[i].checked=false;
        }
    }
}

function getRadioValue(){
	var radios = document.getElementsByName("edu");
	for (var i = 0; i < radios.length; i++) {
		var radio = radios[i];
		if (radio.checked) {           //判断是否选中
			alert(radio.value);
		}
	}
	return value
}