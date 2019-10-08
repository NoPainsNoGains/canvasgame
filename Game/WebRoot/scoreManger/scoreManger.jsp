<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Score Record</title> 
    <link rel="stylesheet" type="text/css" href="../easyui/themes/metro-orange/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
	<script type="text/javascript" src="../easyui/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
	 
	<script>
		$(function() {
			/*grid*/
			$('#userrolemanger').datagrid({
				iconCls : 'icon-save',
				width : $(this).width()*0.95,
				height : $(this).height()*0.95,
				nowrap : false,
				striped : true,
				collapsible : true,
				url : 'scoreManger/ScoreManger_List.action',
				sortName : 'code',
				sortOrder : 'desc',
				remoteSort : false,
				idField : 'scoreId',
				frozenColumns : [ [ 
					{field : 'ck',checkbox : true,align : 'center'},
					{field : 'scoreId',title : 'ScoreId',align : 'left',hidden : true}, 
				] ],
				columns : [ [ 
					{title : 'Score basic message',colspan : 10}
				], [
					{field : 'sysAdmin',title : 'UserName',align : 'left',width : $(this).width() * 0.15,rowspan : 2,sortable : true,
						formatter:function(value,rec){
							return value.adminName;
						}
					},
					{field : 'scoreNumber',title : 'Score Number',align : 'left',width : $(this).width() * 0.15,rowspan : 2,sortable : true,
						formatter:function(value,rec){
							if(value==1){
								return "Go on-go Test";
							}
							if(value==2){
								return "Stroop Test";
							}
							if(value==3){
								return "Trail Making Test";
							}
							return "UnKown";
						}
					},
					{field : 'scoreGrade',title : 'Score Grade',align : 'left',width : $(this).width() * 0.15,rowspan : 2,sortable : true},
					{field : 'scoreDate',title : 'Score Date',align : 'left',width : $(this).width() * 0.15,rowspan : 2,sortable : true}
				]],
				pagination : true,
				rownumbers : true
			});	
		});
	</script>
  </head>
  <body>
  	<!-------------------------------------------------grid--------------------------------------------->
  	<table id="userrolemanger" ></table>
</body>
</html>
