package com.game.service.userManager;

import com.game.po.SysAdmin;


public interface LoginService {
	public SysAdmin existAdminService(String userName,String passWord);
}
