<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../userManger/adminsessionM.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"  charset="UTF-8" name="renderer" content="webkit"/>
<title>Test Record</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/metro-gray/easyui.css">
<script type="text/javascript" src="easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>


<style type="text/css">
body {
	font: 12px/20px "微软雅黑", "宋体", Arial, sans-serif, Verdana, Tahoma;
	padding: 0;
	margin: 0;
}
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: underline;
}
a:active {
 text-decoration: none;
}
.cs-north {
	height:68px;background:#d4ecff;
}
.cs-north-bg {
	width: 100%;
	height: 100%;
background:url('easyui/images/bg.png') repeat-x ; 
}
.cs-north-logo {
	height: 40px;
	 margin:0px;
        padding:15px,0px,0px,5px;
	color:#fff;font-size:22px;font-weight:bold;text-decoration:none;

}
.cs-west {
	width:165px;padding:0px;border-left:1px solid #99BBE8;
}
.cs-south {
	height:25px;background:url('easyui/themes/gray/images/panel_title.gif') repeat-x;padding:0px;text-align:center;
}

.cs-tab-menu {
	width:120px;
}
.cs-home-remark {
	padding: 0px;
}
#Layer1 {
	position:fixed;
	width:150px;
	height:25px;
	z-index:1;
	left: 80%;
	top: 5%;
	color: #ffffff;
}
</style>
<style>
 #navtree > li > div{
   background: #efefef;
border-top-width: 0;
cursor: pointer;
 }
</style>
<script type="text/javascript">
	$(function(){		
			function addTab(title, url){
				if ($('#tabs').tabs('exists', title)){
					$('#tabs').tabs('select', title);//选中并刷新
					var currTab = $('#tabs').tabs('getSelected');
					var url = $(currTab.panel('options').content).attr('src');
					if(url != undefined && currTab.panel('options').title != 'Home') {
						$('#tabs').tabs('update',{
							tab:currTab,
							options:{
								content:createFrame(url)
							}
						});
					}//if
				} else {
					var content = createFrame(url);
					$('#tabs').tabs('add',{
						title:title,
						content:content,
						closable:true
					});
				}//if else
				tabClose();
			}//addTab
			
			function createFrame(url) {
				var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
				return s;
			}//createFrame
			
			function tabClose() {
				/*双击关闭TAB选项卡*/
				$(".tabs-inner").dblclick(function(){
					var subtitle = $(this).children(".tabs-closable").text();
					$('#tabs').tabs('close',subtitle);
				});
				/*为选项卡绑定右键*/
				$(".tabs-inner").bind('contextmenu',function(e){
					$('#mm').menu('show', {
						left: e.pageX,
						top: e.pageY
					});
					var subtitle =$(this).children(".tabs-closable").text();
					$('#mm').data("currtab",subtitle);
					$('#tabs').tabs('select',subtitle);
					return false;
				});
			}//	tabClose
			
		
			function tabCloseEven() {//绑定右键菜单事件
				$('#mm-tabupdate').click(function(){	//刷新
					var currTab = $('#tabs').tabs('getSelected');
					var url = $(currTab.panel('options').content).attr('src');
					if(url != undefined && currTab.panel('options').title != 'Home') {
						$('#tabs').tabs('update',{
							tab:currTab,
							options:{
								content:createFrame(url)
							}
						});
					}
				});
				$('#mm-tabclose').click(function(){	//关闭当前
					var currtab_title = $('#mm').data("currtab");
					$('#tabs').tabs('close',currtab_title);
				});	
				$('#mm-tabcloseall').click(function(){//全部关闭
					$('.tabs-inner span').each(function(i,n){
						var t = $(n).text();
						if(t != 'Home') {
							$('#tabs').tabs('close',t);
						}
					});
				});
				$('#mm-tabcloseother').click(function(){//关闭除当前之外的TAB
					var prevall = $('.tabs-selected').prevAll();
					var nextall = $('.tabs-selected').nextAll();		
					if(prevall.length>0){
						prevall.each(function(i,n){
							var t=$('a:eq(0) span',$(n)).text();
							if(t != 'Home') {
								$('#tabs').tabs('close',t);
							}
						});
					}
					if(nextall.length>0) {
						nextall.each(function(i,n){
							var t=$('a:eq(0) span',$(n)).text();
							if(t != 'Home') {
								$('#tabs').tabs('close',t);
							}
						});
					}
					return false;
				});
				$('#mm-tabcloseright').click(function(){//关闭当前右侧的TAB
					var nextall = $('.tabs-selected').nextAll();
					if(nextall.length==0){
						//msgShow('系统提示','后边没有啦~~','error');
						alert('sorry');
						return false;
					}
					nextall.each(function(i,n){
						var t=$('a:eq(0) span',$(n)).text();
						$('#tabs').tabs('close',t);
					});
					return false;
				});
				$('#mm-tabcloseleft').click(function(){	//关闭当前左侧的TAB
					var prevall = $('.tabs-selected').prevAll();
					if(prevall.length==0){
						alert('sorry');
						return false;
					}
					prevall.each(function(i,n){
						var t=$('a:eq(0) span',$(n)).text();
						$('#tabs').tabs('close',t);
					});
					return false;
				});	
				$("#mm-exit").click(function(){//退出
					$('#mm').menu('hide');
				});
			}//tabCloseEven
	
			tabCloseEven();
			$('.cs-navi-tab').click(function() {
				var $this = $(this);
				var href = $this.attr('src');
				var title = $this.text();
				addTab(title, href);
			});
			$('body').layout();
			$('body').css('visibility', 'visible');
});//function
</script>
<script type="text/javascript">
function logout(){
	$.messager.confirm('please confirm', 'Are you sure exit system ?', function(r){
		if (r){
			$.ajax({
				url : 'userManger/LoginManger_loginOut.action', 
				async:false,
				type:"post",
				success : function(d) {					
					$.messager.show({						
						title : 'Remind',
						msg : 'exit success please waiting!'
					}); 
					 setTimeout(function(){document.location.href="login.jsp";}, 2000);
				}		
			});
		}
	});	
}
</script>
</head>
 <body class="easyui-layout" style="visibility: hidden;">
	<div region="north" border="true"  class="cs-north">
		<div  class="cs-north-bg"  style="overflow: hidden;"><div   class="cs-north-logo"><img src="easyui/images/logo.png"  border="0" /></div>
		 <div id="Layer1" style="text-align:right"><a href="javascript:logout()"><font color=white>Exit</font></a></div></div>
	</div>
	
	<div region="west" border="true" split="true" title="Menu" class="cs-west">
		<div class="easyui-accordion" fit="true" border="false">	
				<div title="User Manager" headerCls="accordion-font-color" icon="icon-accordion-node">
					<a href="javascript:void(0);" src="userManger/userManger.jsp" class="cs-navi-tab">User</a></p>
				</div>
				<div title="Record Manager" headerCls="accordion-font-color" icon="icon-accordion-node">
					<a href="javascript:void(0);" src="scoreManger/scoreManger.jsp" class="cs-navi-tab">Test Record</a></p>
				</div>
		</div>
		
	</div>
	<div id="mainPanle" region="center" border="true" border="false" >
		 <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
                <div title="Home">
				<div class="cs-home-remark">
					<h1>Game Test</h1> 
				</div>
				</div>
        </div>
	</div>
	<div region="south" border="false" class="cs-south"></div>
		<div id="mm" class="easyui-menu cs-tab-menu">
			<div class="menu-sep"></div>
			<div id="mm-tabclose">close</div>
			<div id="mm-tabcloseother">close other</div>
			<div id="mm-tabcloseall">close all</div>
		</div>
</body>
</html>
