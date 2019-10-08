<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="../../userManger/adminsession.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>gonogo</title>
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../../easyui/demo/demo.css">
	<script type="text/javascript" src="../../easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
	<script src="js/gonogoJS.js"></script>
	<script type="text/javascript">  
		$(function(){ 
		 initjs(); 
		});
		function loadTime(time){
		parent.window.reloadTime(time);}
		function reloadTime(){
		parent.window.reinit();}
	</script> 
</head>
<style>
div#right
{
height:250px;
border:10px solid gray;
border-radius:15px;
}
div#left
{
height:250px;
border:10px solid gray;
border-radius:15px;
}

</style>

<body >
   <div id="page" style="width:100%;height:550px;">
		<div style="height:25%;">
			<p style="background: black;color: white ; text-align: center;font-size: 30px">Test of GoNoGo</p></div>
		<div style="width:100%; height:50%; margin-left: auto;margin-right: auto;">
     	 <div  style="width:20%; float:left; ">.</div>
     	 <div  id ="left" style="width:20%; float:left; ">  </div>
     	 <div  style="width:10%; float:left; ">
			<button id="st" style="width: 150px;height: 50px;" onclick="start()">Click here to start Test</button>
		</div>
     	 <div  id="right" style="width:20%; float:left; "> </div>
     	 <div  style="width:20%; float:left; ">.</div>
		</div> 
		<div style="height:25%;" id="cen">.</div>
	</div>
	<!-- <button type="button" onclick="start()">Start Game</button> -->
</body>
</html>