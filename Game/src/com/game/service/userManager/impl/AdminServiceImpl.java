package com.game.service.userManager.impl;

import java.util.ArrayList;
import java.util.List;

import com.game.dao.userManager.AdminDao;
import com.game.po.SysAdmin;
import com.game.service.userManager.AdminService;
import com.game.util.DateUtil;
import com.game.vo.AdminForm;


public class AdminServiceImpl implements AdminService{
	private AdminDao adminDaoImpl;
	
	public AdminDao getAdminDaoImpl() {
		return adminDaoImpl;
	}

	public void setAdminDaoImpl(AdminDao adminDaoImpl) {
		this.adminDaoImpl = adminDaoImpl;
	}
	public List<AdminForm> listPoToVo(List<SysAdmin> sysAdminList){
		List<AdminForm> adminFormList = new ArrayList<AdminForm>();
		AdminForm adminForm = null;
		for(SysAdmin admin:sysAdminList){
			adminForm = new AdminForm();
			adminForm.setAdminBirth(admin.getAdminBirth().toString());
			adminForm.setAdminId(admin.getAdminId());
			adminForm.setAdminName(admin.getAdminName());
			adminForm.setAdminPassWord(admin.getAdminPassWord());
			adminForm.setAdminRemarks(admin.getAdminRemarks());
			adminForm.setAdminSex(admin.getAdminSex());
			adminForm.setAdminTel(admin.getAdminTel());
			adminForm.setAdminType(admin.getAdminType());
			adminFormList.add(adminForm);
		}
		return adminFormList;
	}
	 /*save vo->po对象*/
	public SysAdmin saveVoToPo(AdminForm userForm){	
		SysAdmin temp = new SysAdmin();
		temp.setAdminBirth(DateUtil.StrToDate(userForm.getAdminBirth()));
		temp.setAdminName(userForm.getAdminName());
		temp.setAdminPassWord(userForm.getAdminPassWord());
		temp.setAdminRemarks(userForm.getAdminRemarks());
		temp.setAdminSex(userForm.getAdminSex());
		temp.setAdminTel(userForm.getAdminTel());
		temp.setAdminType(userForm.getAdminType());
		return temp;
	}
	/*update vo->po对象*/
	public SysAdmin updateVoToPo(AdminForm userForm){
		SysAdmin temp = new SysAdmin();
		SysAdmin sys = adminDaoImpl.findObjectById(userForm.getAdminId());
		temp.setAdminId(userForm.getAdminId());
		temp.setAdminBirth(DateUtil.StrToDate(userForm.getAdminBirth()));
		temp.setAdminName(userForm.getAdminName());
		temp.setAdminPassWord(userForm.getAdminPassWord());
		temp.setAdminRemarks(userForm.getAdminRemarks());
		temp.setAdminSex(userForm.getAdminSex());
		temp.setAdminTel(userForm.getAdminTel());
		temp.setAdminType(sys.getAdminType());
		return temp;
	}
	/*get po->vo对象*/
	public AdminForm getAdminPoToVo(SysAdmin user){
		AdminForm temp = new AdminForm();
		temp.setAdminBirth(user.getAdminBirth().toString());
		temp.setAdminId(user.getAdminId());
		temp.setAdminName(user.getAdminName());
		temp.setAdminPassWord(user.getAdminPassWord());
		temp.setAdminRemarks(user.getAdminRemarks());
		temp.setAdminSex(user.getAdminSex());
		temp.setAdminTel(user.getAdminTel());
		return temp;
	}
	@Override
	public List<AdminForm> listService(int page, int rows) {
		List<SysAdmin> sysAdminList = adminDaoImpl.list(page, rows);
		return this.listPoToVo(sysAdminList);
	}

	@Override
	public int countService() {
		return adminDaoImpl.countTotal();
	}

	@Override
	public boolean existService(String userName) {
		return adminDaoImpl.isExist(userName);
	}

	@Override
	public void saveService(AdminForm user) {
		SysAdmin sysAdmin =this.saveVoToPo(user);
		adminDaoImpl.save(sysAdmin);
	}

	@Override
	public void updateService(AdminForm user) {

		if("".equals(user.getAdminBirth()) || " ".equals(user.getAdminBirth())){//用户没有修改时间
			SysAdmin sysAdmin1  = new SysAdmin();
			SysAdmin temp = adminDaoImpl.findObjectById(user.getAdminId());
			sysAdmin1.setAdminBirth(temp.getAdminBirth());
			sysAdmin1.setAdminId(temp.getAdminId());
			sysAdmin1.setAdminName(user.getAdminName());
			sysAdmin1.setAdminPassWord(user.getAdminPassWord());
			sysAdmin1.setAdminRemarks(user.getAdminRemarks());
			sysAdmin1.setAdminSex(user.getAdminSex());
			sysAdmin1.setAdminTel(user.getAdminTel());
			sysAdmin1.setAdminType(temp.getAdminType());
			adminDaoImpl.update(sysAdmin1);
		}else{
			SysAdmin sysAdmin = this.updateVoToPo(user);
			adminDaoImpl.update(sysAdmin);
		}
	}

	@Override
	public AdminForm listByUserNameService(String adminName) {
		SysAdmin sysAdmin = adminDaoImpl.getUserByUserName(adminName);
		return this.getAdminPoToVo(sysAdmin);
	}
	
	public AdminForm listByIdPoToVo(SysAdmin sysAdmin){
		if(sysAdmin==null){
			return null;
		}else{
			AdminForm adminForm = new AdminForm();
			adminForm.setAdminBirth(sysAdmin.getAdminBirth().toString());
			adminForm.setAdminId(sysAdmin.getAdminId());
			adminForm.setAdminName(sysAdmin.getAdminName());
			adminForm.setAdminPassWord(sysAdmin.getAdminPassWord());
			adminForm.setAdminRemarks(sysAdmin.getAdminRemarks());
			adminForm.setAdminSex(sysAdmin.getAdminSex());
			adminForm.setAdminTel(sysAdmin.getAdminTel());
			return adminForm;
		}
	}
	@Override
	public List<AdminForm> listByIdService(Integer id) {
		SysAdmin sysAdmin = adminDaoImpl.listById(id);
		AdminForm adminForm = this.listByIdPoToVo(sysAdmin);
		List<AdminForm> list = new ArrayList<AdminForm>();
		if(adminForm==null){
			return null;
		}
		list.add(adminForm);
		return list;
	}

}
