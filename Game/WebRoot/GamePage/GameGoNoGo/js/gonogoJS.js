/**
 * 
 */
function initjs(){
	getAllBlack();
	ShowBeforStart();
}

function ShowBeforStart(){
	 document.getElementById("st").style.visibility="visible";
     document.getElementById("left").style.visibility="hidden";
     document.getElementById("right").style.visibility="hidden";
}

function sleep(d){
	  for(var t = Date.now();Date.now() - t <= d;);
	}
	 
	
function getAllBlack(){
	document.getElementById("page").style.backgroundColor = "black";
	document.getElementById("left").style.borderColor = "black";
	document.getElementById("right").style.borderColor = "black";
	document.getElementById("left").style.backgroundColor = "black";
	document.getElementById("right").style.backgroundColor = "black";
}

function getLeftGreen(){
	//左边绿色通行
	document.getElementById("left").style.borderColor = "gray";
	document.getElementById("left").style.backgroundColor = "green";
	document.getElementById("right").style.borderColor = "gray";
	document.getElementById("right").style.backgroundColor = "black";
}

function getLeftRed(){
	//左边红色禁止通行
	document.getElementById("left").style.borderColor = "gray";
	document.getElementById("left").style.backgroundColor = "red";
	document.getElementById("right").style.borderColor = "gray";
	document.getElementById("right").style.backgroundColor = "black";
}

function getRrightGreen(){
	//右边绿色通行
	document.getElementById("left").style.borderColor = "gray";
	document.getElementById("left").style.backgroundColor = "black";
	document.getElementById("right").style.borderColor = "gray";
	document.getElementById("right").style.backgroundColor = "green";
}

function getRrightred(){
	//右边红色禁止通行
	document.getElementById("left").style.borderColor = "gray";
	document.getElementById("left").style.backgroundColor = "black";
	document.getElementById("right").style.borderColor = "gray";
	document.getElementById("right").style.backgroundColor = "red";
}

function GetShow()
{
var Range = 4 - 1;   
var Rand = Math.random();   
var flag = 1+Math.round(Rand * Range);
	switch (flag){
	case 1:
		getLeftGreen();
		break;
	case 2:
		getLeftRed();
		break;
	case 3:
		getRrightGreen();
		break;
	case 4:
		getRrightred();
		break;
	}
return flag;
}   

function getKey(event){
    var e = event || window.event || arguments.callee.caller.arguments[0];
    if(e && e.keyCode==37){ // 按 left 
        //要做的事情
        alert("<--");
      }
    if(e && e.keyCode==39){ // 按 right 
         //要做的事情
         alert("-->");
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

function start(){
	document.getElementById("st").style.visibility="hidden ";
    document.getElementById("left").style.visibility="visible ";
    document.getElementById("right").style.visibility="visible ";
	startOneStep(1);
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

function EndGame(s){
	reloadTime();
	s=s-1;
	if(s<=5){
		socor = s*20;
	}else if(s<=10){
		socor = 100+(s-5)*40;
	}else if(s<=15){
		socor = 300+(s-10)*50;
	}else if(s<=20){
		socor = 550+(s-15)*100;
	}
	document.getElementById("st").style.visibility="visible ";
    document.getElementById("left").style.visibility="hidden ";
    document.getElementById("right").style.visibility="hidden ";
    document.getElementById("st").innerHTML="Restart";
    insertDataToDB(1,socor);
	alert("Game over,You pass:"+s+"tests,   The total score:"+socor);
}

function insertDataToDB(number,score){
	$.post('../../scoreManger/ScoreManger_Add.action', {
		scoreNumber : number,
		scoreGrade : score
	}, function(data){
		if(data == null){
			alert("System is error;please connect admin");
		}else{
		}
	}, "json");
}

function startOneStep(s){
	if(s>20){
		alert(" Congratulations,Mission accomplished ! ");
		EndGame(s); 
		return;
	}else {
		var level = Getlevel(s);
		var timeLimit = GetTimeLimit(level);
		var flag = GetShow();
		loadTime(timeLimit*1000);
		var meter1 = setTimeout(function(){	if(flag==2||flag==4){
												s=s+1;//关数加1	
												getAllBlack();
												meter2=setTimeout("startOneStep("+s+")", timeLimit*200);
											}else {EndGame(s);} }, timeLimit*1000);
		document.onkeydown=function(event){
			var e = event || window.event || arguments.callee.caller.arguments[0];
		    if(e && e.keyCode==37){ // 按 left 
		        //要做的事情
		    	reloadTime();
		    	clearTimeout(meter1);
		    	document.getElementById("left").style.borderColor = "yellow";
		    	if(flag==1){
		    		//alert("yellow");
		    		s=s+1;//关数加1
		    		setTimeout("getAllBlack()", 400);
		    		meter2=setTimeout("startOneStep("+s+")", 400+timeLimit*200);
		    	}else{
		    		//alert("错误 <--");
		    		EndGame(s);
		    	}
		    	return;
		      }else  if(e && e.keyCode==39){ // 按 right 
		         //要做的事情
		    	reloadTime();
		    	clearTimeout(meter1);
		    	document.getElementById("right").style.borderColor = "yellow";
		    	if(flag==3){
		    		//document.getElementById("right").style.borderColor = "red";
		    		s=s+1;//关数加1
		    		setTimeout("getAllBlack()", 400); 
					meter2=setTimeout("startOneStep("+s+")", 400+timeLimit*200);
		    	}else{
		    		//alert("错误-->");
		    		EndGame(s);
		    	}
		    	return;
		      }  
		    return;
		}
	}
}


