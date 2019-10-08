<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>User Admin</title> 
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
				url : 'userManger/AdminManger_ListById.action',
				sortName : 'code',
				sortOrder : 'desc',
				remoteSort : false,
				idField : 'adminId',
				frozenColumns : [ [ 
					{field : 'ck',checkbox : true,align : 'center'},
					{field : 'adminId',title : 'Userid',align : 'left',hidden : true}, 
				] ],
				columns : [ [ 
					{title : 'User basic message',colspan : 10}
				], [
					{field : 'adminName',title : 'UserName',align : 'left',width : $(this).width() * 0.15,rowspan : 2,sortable : true},
					{field : 'adminPassWord',title : 'PassWord',align : 'left',width : $(this).width() * 0.15,rowspan : 2,sortable : true},
					{field : 'adminTel',title : 'Telephone',align : 'left',width : $(this).width() * 0.15,rowspan : 2,sortable : true},
					{field : 'adminBirth',title : 'Birthday',align : 'left',width : $(this).width() * 0.15,rowspan : 2,sortable : true},
					{field : 'adminSex',title : 'Sex',align : 'center',width : $(this).width() * 0.15,rowspan : 2,sortable : true,
						formatter : function(value, rec) {
							if (value == 0) {
								return "Male";
							} else {
								return "Female";
							}
						}
					
					},
					{field : 'adminRemarks',title : 'Description',align : 'left',width : $(this).width() * 0.15,rowspan : 2,sortable : true}
				]],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btncut',
					text : 'Edit',
					iconCls : 'icon-edit',
					handler : function() {
						$('#btnsave').linkbutton('enable');
						edit();
					}
				}],
				onLoadSuccess: function()
				{
					$('#authoritydisplay').css('display','block');
				}
			});
			$('#class_toolbar').appendTo('.datagrid-toolbar'); 
		});
		/*********************************编辑************************************/
		//日期格式化
		function formatDate(date){
		    var month = date.getMonth()+1;
		    if( "" != date ){
		        if( date.getMonth() +1 < 10 ){
		            month = '0' + (date.getMonth() +1);
		        }
		        var day = date.getDate();
		        if( date.getDate() < 10 ){
		            day = '0' + date.getDate();
		        }
		       //返回格式化后的时间
		        return month+"/"+day+"/"+date.getFullYear()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
		    }else{
		        return "";
		    }
		 }
		function editClose(){
			clearEditForm();
			$('#editAdminPanel').dialog('close');
		}
		function editClose(){
			$('#editAdminPanel').dialog('close');
			$('#userrolemanger').datagrid('unselectAll');
			$('#userrolemanger').datagrid('reload'); 
		}
		/*编辑*/
		function editWriteDate(rows){
		 	 document.getElementById("editAdminId").value=rows[0].adminId;      
			 document.getElementById("editAdminName").value=rows[0].adminName;
			 document.getElementById("editAdminPassWord").value=rows[0].adminPassWord;
			 document.getElementById("editAdminTel").value=rows[0].adminTel;   
			 document.getElementById("editAdminRemarks").value=rows[0].adminRemarks;
			 var str = rows[0].adminBirth.substring(0,rows[0].adminBirth.length-2); 
			 $('#editAdminSex').combobox('setValue',rows[0].adminSex);
			 var myDate= new Date(Date.parse(str.replace(/-/g, "/")));  
			 var formate= formatDate(myDate);	
			   $('#editAdminBirth').datetimebox('setText',str); 
			
		}
		function edit() {
			var rows = $('#userrolemanger').datagrid('getSelections');
			if (rows.length == 1) {
				$('#editAdminPanel').dialog('open').dialog('setTitle', 'Edit personal message');
				editWriteDate(rows);
			} else if (rows.length > 1){
				$.messager.alert('Remind', 'Only can choose one personal message!', 'error');
				$('#userrolemanger').datagrid('unselectAll');	
			} else {
				$.messager.alert('Remind', 'Please choose your personal message!', 'error');
			}
		}
		function editsave() {
			var rows = $('#userrolemanger').datagrid('getSelections');
			if(rows[0].adminName==document.getElementById("editAdminName").value){//用户名字未改变
				$('#edit_admin').form('submit', {
					url : 'userManger/AdminManger_Edit.action',
					onSubmit : function() {
						return $(this).form('validate');
					},
					dataType : 'json',
					type:"post",
					success : function(d) {	
						editClose();
						$.messager.show({
							title : 'Remind',
							msg : 'Edit Success!'
						});		
					}
				});
			}else{//改变了名字
				$('#edit_admin').form('submit', {
					url : 'userManger/AdminManger_EditIsExist.action',
					onSubmit : function() {
						return $(this).form('validate');
					},
					dataType : 'json',
					type:"post",
					success : function(d) {	
						if(d == 0){
							$.messager.show({
								title : 'Remind',
								msg : 'User Name has exist!'
							});		 
						}else{
							editClose();
							$.messager.show({
								title : 'Remind',
								msg : 'Edit Success!'
							});		
						}
					}
				});
			}
		
		}
	/*查找用户*/
	function finduser(){
		var usernumber = document.getElementById("usernumberinput").value;
		var ids = [];
		ids.push(usernumber);
		$.ajax({
			url : 'userManger/AdminManger_FindUser.action',	
			async:false,
			type:"post",
			data : { //传给action的数据 不用？来传参数
				ids : ids.join(',')
			},
			dataType : 'json',
			success : function(data) {
				$('#userrolemanger').datagrid('loadData', data);
				document.getElementById("usernumberinput").value="";
			}		
		});
	}
	</script>
  </head>
  <body>
  	<!-------------------------------------------------grid--------------------------------------------->
  	<table id="userrolemanger" ></table>
 	<div id="class_toolbar" style="padding :4px;text-align:right" >   	
	      	<span><font size=2>.</font></span>
		 
    </div>
 <div id="authoritydisplay" style="display:none">
	<!---------------------------------------------------------编辑管理员--------------------------------------->
	<div id="editAdminPanel" class="easyui-dialog" style="width:360px;height:480px;top:100px;padding:10px" closed="true" buttons="#dlg-button2">
		<form id="edit_admin">
			<input id="editAdminId" name="adminForm.adminId" style="display:none;">
			<ul>
				<li>
					<label  class="required">
						User Name：
					</label>
					<input id="editAdminName" name="adminForm.adminName" style="width:178px;" class="easyui-validatebox" required="true" validType="maxLength[40]" missingMessage="40字符以内" 
						onkeyup="value=value.replace(/[^\w\u4E00-\u9FA5]/g, '')" 
					>
				</li>
				<br>
				<br>
				<li>
					<label  class="required">
						Pass Word：
					</label>
					<input id="editAdminPassWord" name="adminForm.adminPassWord" style="width:178px;" class="easyui-validatebox" required="true" missingMessage="只能为数字"
					type='text' onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" 
					/>
				</li>
				<br>
				<br>
				<li>
					<label class="required">
						Sex:&nbsp&nbsp
					</label>&nbsp
					<select id="editAdminSex"  class="easyui-combobox" name="adminForm.adminSex"  panelHeight="50" required="true">
							<option value="0">Male</option>
							<option value="1">Female</option>
					</select>
				</li>
				<br>
				<br>
				<li>
					<label  class="required">
						Birth Day：
					</label>
					<input id="editAdminBirth" name="adminForm.adminBirth" class="easyui-datetimebox">
				</li>
				<br>
				<br>
				<li>
					<label  class="required">
						Tel Phone：
					</label>
					<input id="editAdminTel" name="adminForm.adminTel" style="width:178px;" class="easyui-validatebox" required="true" validType="maxLength[12]" missingMessage="只能为数字"
					type='text' onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" 
					/>
				</li>
				<br>
				<br>
				<li>
					<label  class="required">
						Remarks：&nbsp
					</label>
					
					<input id="editAdminRemarks" name="adminForm.adminRemarks" class="easyui-textbox" data-options="multiline:true" value="" style="width:178px;height:100px">
				</li>
				
			</ul>		
		</form>
	</div>
	<div id="dlg-button2">
		<right>
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="editsave()">Save</a> 
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="editClose()">Cancel</a>
		</right>
	</div>
</div>
</body>
</html>
