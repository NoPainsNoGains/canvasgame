<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Test Login</title>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="easyui/themes/gray/easyui.css">
<script type="text/javascript" src="easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<script type="text/javascript" charset="UTF-8">
	$(function() {
		var loginDialog;
		loginDialog = $('#loginDialog').dialog({
			closable : false, // 组件添加属性：让关闭按钮消失
			modal : true, //模式化窗口
			buttons : [{
						text : 'reset',
						handler : function() {
						    document.getElementById("userName").value="";
						    document.getElementById("password").value="";
						}
					},{
						text : 'login',
						handler : function() {
								$.post('userManger/LoginManger_decide.action', {
									userName : $('#loginForm input[name=userName]').val(),
									passWord : $('#loginForm input[name=password]').val()
								}, function(data)//回调函数
								{
								
									if(data == null){//不能统一认证
										$.messager.show({						
											title : '提示',
											msg : '系统出错 联系管理员'
										}); 
									}else{
										  switch(data){ 
										   case -1:
												 $.messager.show({						
													title : 'Remind',
													msg : 'please confirm your username and password !'
												 }); 
					      				 		 break;
											case 0://user
												 $.messager.show({						
													title : 'Remind',
													msg : 'login success please waiting...'
												 }); 
					      						 setTimeout(function(){document.location.href="main.jsp";}, 4000); 
					      				 		 break;
									        case 1://admin
									        	 $.messager.show({						
													title : 'Remind',
													msg : 'login success please waiting...'
												 }); 
									        	setTimeout(function(){document.location.href="admin.jsp";}, 4000);  
									            break;	
									        default://用户名密码错误
										        $.messager.show({						
													title : '提示',
													msg : '用户名密码错误'
												}); 
									            break;						   
										}//switch
									}
								}, "json"//返回类型
								);
					}
			} ]
		}); 
		$.extend($.fn.validatebox.defaults.rules, {
			equalTo : {
				validator : function(value, param) {
					return $(param[0]).val() == value;
				},
				message : '字段不匹配'
			}
		});
		$.extend($.fn.validatebox.defaults.rules, {
			minLength : {
				validator : function(value, param) {
					return value.length >= param[0];
				},
				message : 'Please enter at least {0} characters.'
			}
		});
	});
</script>
</head>
<body style="width:100%;height:100%;">
	<div id="loginDialog" title="User Login" style="width:320px;height:180px;">
		<form id="loginForm" method="post">
			<ul>
				<li>
					<label  class="required">
						UserName：&nbsp&nbsp
					</label>
					<td><input id="userName" type="text" name="userName"><br>
				</li>
				<br><br>
				<li>
					<label  class="required">
						PassWord：&nbsp&nbsp
					</label>
						<td><input id="password" type="password" name="password"><br>
				</li>
			</ul>
		</form>
	</div>
</body>
</html>
