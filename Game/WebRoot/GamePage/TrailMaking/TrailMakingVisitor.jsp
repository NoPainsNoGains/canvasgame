<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Trail Making</title> 
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../../easyui/demo/demo.css">
	<script type="text/javascript" src="../../easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
	<script src="js/TrailMakingVisitor.js"></script>
	<script type="text/javascript">  
		$(function(){ 
		 	initjs(); 
		});
		function loadTime(time){
			parent.window.reloadTime(time);
		}
		function reloadTime(){
		parent.window.reinit();}
	</script>
</head>
<body >
    <p style="background: white;color: black ; text-align: center;font-size: 30px">Trail Making</p>
    <p style="background: white;color: black ; text-align: center;font-size: 20px">Please connect circle in correct order:</p>
   	<p style="margin-top: 30px;background: white;text-align: center;">
   		<button id="st" style="margin-bottom: 1px;width: 150px;height: 50px;" onclick="start()">Click here to start Test</button>
   	</p>
    <p id="bts" style="margin-top: 1px; background: white; height:40%; text-align: center; font-size: 700%">
       <canvas id="canvas" width="800" height="560"></canvas>
    </p>
  
</body>
</html>