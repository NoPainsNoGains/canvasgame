package com.game.service.userManager;

import java.util.List;

import com.game.vo.AdminForm;

public interface AdminService {
	public List<AdminForm> listService(int page,int rows);
	public List<AdminForm> listByIdService(Integer id);
	public int countService();
	public boolean existService(String userName);
	public void saveService(AdminForm user);
	public void updateService(AdminForm user);
	public AdminForm listByUserNameService(String adminName);
}
