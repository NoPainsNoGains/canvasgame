package com.game.action.userManager;


import java.util.Map;

import com.game.po.SysAdmin;
import com.game.service.userManager.LoginService;
import com.game.vo.LoginUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport  implements ModelDriven<LoginUser>{
	private static final long serialVersionUID = 1L;
	private LoginUser loginUser;
	private LoginService loginServiceImpl;
	
	public LoginUser getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(LoginUser loginUser) {
		this.loginUser = loginUser;
	}

	public LoginService getLoginServiceImpl() {
		return loginServiceImpl;
	}

	public void setLoginServiceImpl(LoginService loginServiceImpl) {
		this.loginServiceImpl = loginServiceImpl;
	}

	@Override
	public LoginUser getModel() {
		return loginUser;
	}

	public String decide() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		SysAdmin user = loginServiceImpl.existAdminService(loginUser.getUserName(), loginUser.getPassWord());
		if(user==null){
			return "DecideFail";
		}else{
			session.put("user", user);
			if(user.getAdminType()==1){//user
				return "DecideUser";
			}
			if(user.getAdminType()==2){//admin
				return "DecideAdmin";
			}
			return "DecideFail";
		}
	}
	public String loginOut(){
		Map session = ActionContext.getContext().getSession();
		session.remove("user");
		return "LoginOut";
	}
}
