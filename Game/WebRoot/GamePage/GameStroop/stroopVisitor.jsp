<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Stroop Test</title> 
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../../easyui/demo/demo.css">
	<script type="text/javascript" src="../../easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
	<script src="js/stroopVisitor.js"></script>
	<script type="text/javascript">  
		$(function(){ 
		 	initjs(); 
		}) ; 
		function loadTime(time){
		parent.window.reloadTime(time);}
		function reloadTime(){
		parent.window.reinit();}
	</script>
</head>
<body >
    <p style="background: white;color: black ; text-align: center;font-size: 30px">Test of Stroop</p>
   	<p></p>
   	<p></p>
    <p style="background: white;color: black ; text-align: center;font-size: 20px">click the button that matches the color of this word:</p>
   	<p style="margin-top: 100px;background: white;text-align: center;">
   		<button id="st" style="margin-bottom: 1px;width: 150px;height: 50px;" onclick="start()">Click here to start Test</button></p>
    <p id="word" style="margin-top: 10px;background: white; height:40%; text-align: center; font-size: 800%">red</p>
    <p id="bts" style="margin-top: 1px; background: white; height:40%; text-align: center; font-size: 700%">
        <button id="black" type="button" onclick="b1()" style="font-size:30% ">Black</button>
        <button id="blue" type="button" onclick="b2()" style="font-size:30% ">Blue</button>
        <button id="yellow" type="button" onclick="b3()" style="font-size:30% ">Yellow</button>
        <button id="green" type="button" onclick="b4()" style="font-size:30% ">Green</button>
        <button id="red" type="button" onclick="b5()" style="font-size:30% ">Red</button>
    </p>
    <input id="r1" name="ra" value="0" type="radio" hidden="hidden" />
    <input id="r2" name="ra" value="1" type="radio" hidden="hidden"/>
    <input id="r3" name="ra" value="2" type="radio" hidden="hidden"/>
    <input id="r4" name="ra" value="3" type="radio" hidden="hidden"/>
    <input id="r5" name="ra" value="4" type="radio" hidden="hidden"/>
    <input id="r6" name="ra" value="5" type="radio" checked="checked" hidden="hidden"/>
</body>
</html>