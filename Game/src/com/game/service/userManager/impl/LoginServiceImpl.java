package com.game.service.userManager.impl;

import com.game.dao.userManager.AdminDao;
import com.game.po.SysAdmin;
import com.game.service.userManager.LoginService;

public class LoginServiceImpl implements LoginService{
	private AdminDao adminDaoImpl;	

	
	public AdminDao getAdminDaoImpl() {
		return adminDaoImpl;
	}
	public void setAdminDaoImpl(AdminDao adminDaoImpl) {
		this.adminDaoImpl = adminDaoImpl;
	}
	@Override
	public SysAdmin existAdminService(String userName, String passWord) {
		return adminDaoImpl.loginJudje(userName, passWord);
	}
	
}
