package com.game.dao.userManager;

import com.game.dao.CommonDao;
import com.game.po.SysAdmin;



public interface AdminDao extends CommonDao<SysAdmin>{
	public boolean isExist(String adminName);
	public int countTotal();
	public SysAdmin getUserByUserName(String adminName) ;
	public SysAdmin loginJudje(String userName, String passWord);
	public SysAdmin listById(Integer id);
}
